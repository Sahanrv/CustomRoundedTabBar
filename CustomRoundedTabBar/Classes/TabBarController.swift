//
//  TabBarController.swift
//  CustomRoundedTabBar
//
//  Created by Sahan Ravindu on 5/13/20.
//  Copyright © 2020 Sahan Ravindu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let prominentTabBar = self.tabBar as! ProminentTabBar
        prominentTabBar.prominentButtonCallback = prominentTabTaped
        // Do any additional setup after loading the view.
    }


    func prominentTabTaped() {
        selectedIndex = (tabBar.items?.count ?? 0)/2
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


//class TbBarController: UITableViewController {
//    
//    override func viewDidLoad() {
//            let button = UIButton()
//            button.setImage(UIImage(named: "home"), for: .normal)
//            button.sizeToFit()
//            button.translatesAutoresizingMaskIntoConstraints = false
//        
//            let tabBarco = self.tabBar as! ProminentTabBar
//            tabBarco.addSubview(button)
//            tabBarco.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
//            tabBarco.topAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
//     }
//
//     
//}
