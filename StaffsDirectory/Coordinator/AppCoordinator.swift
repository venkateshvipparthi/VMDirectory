//
//  AppCoordinator.swift
//  VMDirectoryAPP
//
//  Created by Venkatesh on 08/07/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var tabBarController: UITabBarController { get set }
    func start()
}
class AppCoordinator: Coordinator {
    var tabBarController: UITabBarController
    private var peoplesCoordinator:PeoplesCoordinator?

    private var roomssCoordinator:RoomsCoordinator?

    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }
    
    func start() {
        let peopleViewNav = createPeoplesFlow()
        let roomsViewNav = createRoomsTab()
        tabBarController.viewControllers = [peopleViewNav, roomsViewNav]
    }
    
    private func createPeoplesFlow()-> UINavigationController {
        let peoplesNavCtrl = UINavigationController()
        peoplesCoordinator = PeoplesCoordinator(navBarController: peoplesNavCtrl)
        peoplesCoordinator?.start()
        return peoplesNavCtrl
    }
    private func createRoomsTab()-> UINavigationController {
        let roomsNavCtrl = UINavigationController()
        roomssCoordinator = RoomsCoordinator(navBarController: roomsNavCtrl)
        roomssCoordinator?.start()
        return roomsNavCtrl
    }
}
