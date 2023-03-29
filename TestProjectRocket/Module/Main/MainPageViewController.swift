//
//  MainPageViewController.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 28.03.2023.
//

import UIKit

// MAERK: - MainPageViewController
final class MainPageViewController: UIPageViewController {
    private var rocketViewController = [UIViewController]()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        //Delete
        rocketViewController = [
            {
                let vc = RocketViewController()
                vc.view?.backgroundColor = .yellow
                return vc
            }(),
            {
                let vc = RocketViewController()
                vc.view?.backgroundColor = .green
                return vc
            }(),
            {
                let vc = RocketViewController()
                vc.view?.backgroundColor = .red
                return vc
            }(),
        ]
        setViewControllers([rocketViewController[0]], direction: .forward, animated: true)
    }
}
// MAERK: - UIPageViewControllerDataSource
extension MainPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = rocketViewController.firstIndex(of: viewController) else {
            return nil
        }
       return index == 0 ? rocketViewController.last : rocketViewController[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = rocketViewController.firstIndex(of: viewController) else {
            return nil
        }
        if viewController == rocketViewController.last {
           return rocketViewController.first
        }  else {
           return rocketViewController[index + 1]
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        rocketViewController.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    
}

