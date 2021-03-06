//
//  PlaceNameCellInteractor.swift
//  FavoritePlaces
//
//  Created by Karol on 03.01.2018.
//  Copyright © 2018 KarolPiatek. All rights reserved.
//

import UIKit

class PlaceNameCellInteractor: CellInteractorProtocol {
    
    var title: String
    var value: String
    var isEditable = true
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
    func configure(_ cell: UITableViewCell) {
        guard let cell = cell as? PlaceNameCell else { return }
        cell.configure(interactor: self, title: title, value: value, isEditable: isEditable)
    }
    
    var cellType: CellType { return PlaceNameCell.self }
}
