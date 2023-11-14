//
//  TabBar.swift
//  Modul14.1
//
//  Created by Руслан Жигалов on 30.05.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = UINavigationController(rootViewController: ViewController1())
        let vc2 = UINavigationController(rootViewController: ViewController2())
        let vc3 = UINavigationController(rootViewController: ViewController3())
        vc1.tabBarItem.image = UIImage(systemName: "circle")
        vc2.tabBarItem.image = UIImage(systemName: "circle")
        vc3.tabBarItem.image = UIImage(systemName: "circle")
        vc1.title = "Доходы"
        vc2.title = "График"
        vc3.title = "Расходы"
        tabBar.tintColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        tabBar.unselectedItemTintColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1)
        tabBar.backgroundColor = .white
        setViewControllers([vc1, vc2, vc3], animated: true)
        
        
        tabBar.frame = CGRect(x: 0, y: 0, width: 375, height: 52)
        }
    }
