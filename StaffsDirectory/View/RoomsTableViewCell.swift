//
//  RoomsTableViewCell.swift
//  VMDirectoryAPP
//
//  Created by Venkatesh on 08/07/2022.
//

import UIKit

final class RoomsTableViewCell: UITableViewCell {

    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var occupiedLabel: UILabel!
    @IBOutlet private weak var maxOccupancyLabel: UILabel!
    @IBOutlet private weak var createdAtLabel: UILabel!
        
    // MARK: Cell life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
    
    override var accessibilityElements: [Any]? {
        set {}
        get {
            return [
                self.idLabel as Any,
                self.occupiedLabel as Any,
                self.maxOccupancyLabel as Any,
                self.createdAtLabel as Any]
        }
    }
    
    override func prepareForReuse() {
        idLabel.text = ""
        occupiedLabel.text = ""
        maxOccupancyLabel.text = ""
        createdAtLabel.text = ""
    }
    
    func setData(room: Room) {
        idLabel.text = room.id
        occupiedLabel.text = room.occupiedMessage
        maxOccupancyLabel.text = "\(room.maxOccupancy)"
        createdAtLabel.text = room.createdAt
        
        self.applyAccessibility(room: room)
    }
    
    private func applyAccessibility(room: Room) {
        idLabel.isAccessibilityElement = true
        idLabel.accessibilityHint = NSLocalizedString("idOfRoom", comment: "")
        idLabel.accessibilityValue = room.id
       
        occupiedLabel.isAccessibilityElement = true
        occupiedLabel.accessibilityHint = NSLocalizedString("roomStatus", comment: "")
        occupiedLabel.accessibilityValue = room.occupiedMessage
        
        maxOccupancyLabel.isAccessibilityElement = true
        maxOccupancyLabel.accessibilityHint = NSLocalizedString("maxOccuapancy", comment: "")
        maxOccupancyLabel.accessibilityValue = "\(room.maxOccupancy)"
       
        createdAtLabel.isAccessibilityElement = true
        createdAtLabel.accessibilityHint = NSLocalizedString("createdOn", comment: "")
        createdAtLabel.accessibilityValue = room.createdAt
    }
}
