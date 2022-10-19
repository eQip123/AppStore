//
//  MainTabBarController.swift
//  AppStore
//
//  Created by Эмир Кармышев on 19.10.22.
//
import UIKit
import Foundation

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: MainViewController(), image: UIImage(named: "Home")),
            generateVC(viewController: HistoryViewController() , image: UIImage(named: "History")),
            generateVC(viewController: NewOrderViewController(), image: UIImage(named: "NewOrder")),
            generateVC(viewController: ChatViewController(), image: UIImage(named: "Chat")),
            generateVC(viewController: InfoViewController(), image: UIImage(named: "Info"))
        ]
    }
    private func generateVC(viewController: UIViewController, image: UIImage?) ->
    UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }
}
