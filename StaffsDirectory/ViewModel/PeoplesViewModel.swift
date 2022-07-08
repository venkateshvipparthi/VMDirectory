//
//  PeoplesViewModel.swift
//  VMDirectoryAPP
//
//  Created by Venkatesh on 08/07/2022.
//

import Foundation

protocol PeopleViewModelInput {
    var delegate: PeoplesViewable? {get set}
    func fetchPeoples(baseUrl: String, path: String)
}

protocol PeopleViewModeloutPut {
    var peoplesCount:Int { get }
    func getPeopleDetailFor(index:Int)-> People?
}

final class PeoplesViewModel {
   
    private var peoples:[PeopleResponce] = []
    private var networkManager: Networkble
    
    weak var delegate: PeoplesViewable?
    
    init(networkManager: Networkble = NetworkManager()) {
        self.networkManager = networkManager
    }
}


extension PeoplesViewModel: PeopleViewModelInput {
    func fetchPeoples(baseUrl: String, path: String) {
        
        networkManager.get(baseUrl, path: path, type: PeopleResponce.self) {[weak self] result in
            
            switch result {
            case .success(let peoples) :
                self?.peoples = peoples
                self?.delegate?.refreshUI()
            case .failure(_) :
                self?.peoples = []
                self?.delegate?.showError()
            }
        }
    
    }
}

extension PeoplesViewModel: PeopleViewModeloutPut {
    
    var peoplesCount:Int {
        return peoples.count
    }
    
    func getPeopleDetailFor(index: Int)-> People? {
        guard index < peoplesCount && index >= 0 else {
            return nil
        }
        
        let people = peoples[index]
        
        return People(firstName: people.firstName ?? "", avatar: people.avatar ?? "", lastName: people.lastName ?? "", email: people.email ?? "", jobTitle: people.jobTitle ?? "", joinedDate: people.createdAt ?? "")
    }
}
