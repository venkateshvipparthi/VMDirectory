//
//  RoomsViewModel.swift
//  VMDirectoryAPP
//
//  Created by Venkatesh on 08/07/2022.
//

import Foundation

protocol RoomsViewModelInput {
    func fetchRooms(baseUrl: String, path: String)
}

protocol RoomsViewModelOutput {
    var roomsCount: Int {get}
    func getRoomFor(index: Int)-> Room?
}

final class RoomsViewModel {

    private var rooms:[RoomsResponce] = []
    private let networkManager: Networkble
    private weak var delegate: RoomsViewControllerType?
    
    init(networkManager: Networkble = NetworkManager(), delegate:RoomsViewControllerType) {
        self.networkManager = networkManager
        self.delegate = delegate
    }
}

extension RoomsViewModel: RoomsViewModelInput {
    func fetchRooms(baseUrl: String, path: String) {
        networkManager.get(baseUrl, path: path, type: RoomsResponce.self) {[weak self] result in
            
            switch result {
            case .success(let rooms) :
                self?.rooms = rooms
                self?.delegate?.refreshUI()
            case .failure(_) :
                self?.rooms = []
                self?.delegate?.showError()
            }
        }
    }
}

extension RoomsViewModel: RoomsViewModelOutput {
    var roomsCount:Int {
        return rooms.count
    }
    
    func getRoomFor(index: Int) -> Room? {
        guard index < roomsCount && index >= 0 else {
            return nil
        }
        let roomModel = rooms[index]
        
        return Room(createdAt: roomModel.createdAt, occupiedMessage: roomModel.isOccupied ? "Occupied" : "Not Occupied", maxOccupancy: roomModel.maxOccupancy, id: roomModel.id)
    }
}
