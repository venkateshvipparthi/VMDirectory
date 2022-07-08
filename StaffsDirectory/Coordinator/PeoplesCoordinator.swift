//
//  PeoplesCoordinator.swift
//  VMDirectoryAPP
//
//  Created by Venkatesh on 08/07/2022.
//

import Foundation
import UIKit

protocol PeoplesCoordinatoryType: AnyObject {
    func navigatToPeopleDetails(people: People)
}

class PeoplesCoordinator: CoordinatorType, PeoplesCoordinatoryType {
    var navController: UINavigationController
    init(navBarController: UINavigationController) {
        self.navController = navBarController
    }
    func start() {
         let peopleViewModel = PeoplesViewModel()
         let peopleVC = PeoplesViewController(peopleViewModel:peopleViewModel, coordinator: self)
            navController.pushViewController(peopleVC, animated: false)
            
            let peoplesTab = UITabBarItem(title: "People", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
            
            navController.tabBarItem = peoplesTab
        }
    
    func navigatToPeopleDetails(people: People) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        if  let peopleDetailsVC = storyBoard.instantiateViewController(withIdentifier:"PeoplesDetailsViewController") as? PeopleDetailsViewController {
            
            peopleDetailsVC.viewModel  =     PeopleDetailsViewModel(people: people)
            navController.pushViewController(peopleDetailsVC, animated: false)
        }
    }
}
