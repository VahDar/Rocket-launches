//
//  RocketNetwork.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 28.03.2023.
//

import Foundation

protocol RocketNetwork {
    func getRockets(complition: @escaping (Result<[Rocket], Error>) -> Void)
    
    func getLaunch(complition: @escaping (Result<[Launch], Error>) -> Void)
}

enum Errors: Error {
    case invalidURL
    case invalidState
}

final class RocketNetworkService: RocketNetwork {
    
    private enum API {
        static let rockets = " https://api.spacexdata.com/v4/rockets"
        static let launches = " https://api.spacexdata.com/v4/launches"
    }
    
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder
    
    init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = .init()) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }
    
    func getRockets(complition: @escaping (Result<[Rocket], Error>) -> Void) {
        guard let url = URL(string: API.rockets) else {
            complition(.failure(Errors.invalidURL))
            return
        }
       urlSession.dataTask(with: URLRequest(url: url)) { [jsonDecoder] data, response, error in
            switch (data, error) {
            case let (.some(data), nil) :
                do {
                    let rockets = try jsonDecoder.decode([Rocket].self, from: data)
                    complition(.success(rockets))
                } catch {
                    complition(.failure(error))
                }
            case let (.none, .some(error)):
                complition(.failure(error))
            default:
                complition(.failure(Errors.invalidState))
            }
        }
            .resume()
    }
    
    func getLaunch(complition: @escaping (Result<[Launch], Error>) -> Void) {
        guard let url = URL(string: API.launches) else {
            complition(.failure(Errors.invalidURL))
            return
        }
       urlSession.dataTask(with: URLRequest(url: url)) { [jsonDecoder] data, response, error in
            switch (data, error) {
            case let (.some(data), nil) :
                do {
                    let rockets = try jsonDecoder.decode([Launch].self, from: data)
                    complition(.success(rockets))
                } catch {
                    complition(.failure(error))
                }
            case let (.none, .some(error)):
                complition(.failure(error))
            default:
                complition(.failure(Errors.invalidState))
            }
        }
            .resume()
    }
    
}
    
