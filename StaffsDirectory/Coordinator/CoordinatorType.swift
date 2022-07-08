//
//  CoordinatorType.swift
//  VMDirectoryAPP
//
//  Created by Venkatesh on 08/07/2022.
//

import Foundation
import UIKit

protocol CoordinatorType: AnyObject {
    var navController: UINavigationController { get set }
    func start()
}
