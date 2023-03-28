//
//  MainPageViewController.swift
//  TestProjectRocket
//
//  Created by Vakhtang on 28.03.2023.
//

import UIKit

// MAERK: - MainPageViewController
final class MainPageViewController: UIPageViewController {
    private var rocketViewController = [RocketViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
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
    }
}
// MAERK: - UIPageViewControllerDataSource
extension MainPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllers,
            let index = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
       return index == 0 ? viewControllers.last : viewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllers,
            let index = viewControllers.firstIndex(of: viewController) else {
            return nil
        }
        if viewController == viewControllers.last {
           return viewControllers.first
        }  else {
           return viewControllers[index + 1]
        }
    }
    
    
}
// MAERK: - UIPageViewControllerDelegate

extension MainPageViewController: UIPageViewControllerDelegate {
    
}
