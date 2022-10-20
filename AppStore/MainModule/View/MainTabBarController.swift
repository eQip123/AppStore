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
        configureTabBarItems()
    }
    private func configureTabBarItems() {
        
        let homeVc = MainViewController()
        homeVc.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home"), tag: 0)
        
        let historyVc = OrderViewController()
        historyVc.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "history"), tag: 1)
        
        let newOrderVc = NewOrderViewController()
        newOrderVc.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "newOrder"), tag: 2)
        
        let chatVc = ChatViewController()
        chatVc.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "chat"), tag: 3)
        
        let infoVc = InfoViewController()
        infoVc.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "info"), tag: 4)
        
        
        
        let homeNavigationVC = UINavigationController(rootViewController: homeVc)
        let historyNavigationVC = UINavigationController(rootViewController: historyVc)
        let newOrderNavigationVC = UINavigationController(rootViewController: newOrderVc)
        let chatNavigationVC = UINavigationController(rootViewController: chatVc)
        let infoNavigationVC = UINavigationController(rootViewController: infoVc)
        
        //Панели вкладок TabBar, добавили их в массив
        setViewControllers([homeNavigationVC, historyNavigationVC, newOrderNavigationVC, chatNavigationVC, infoNavigationVC], animated: true)
        navigationItem.setHidesBackButton(true, animated: true)
    }
}
