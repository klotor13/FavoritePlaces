//
//  PlaceNameCell.swift
//  FavoritePlaces
//
//  Created by Karol on 03.01.2018.
//  Copyright © 2018 KarolPiatek. All rights reserved.
//

import UIKit

class PlaceNameCell: UITableViewCell {

    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeNameTextField: UITextField!
    @IBOutlet weak var placeNameErrorLabel: UILabel!
    
    var interactor: PlaceNameCellInteractor?

    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        interactor?.value = sender.text ?? ""
        UIView.animate(withDuration: Constants.animateDuration, delay: 0.0, options: .transitionCrossDissolve, animations: {
            self.placeNameTextField.layer.borderColor = UIColor.black.cgColor
            self.placeNameErrorLabel.alpha = 0
        })
    }
    
    @IBAction func textFieldEditingDidEnd(_ sender: UITextField) {
        if placeNameTextField.text?.isEmpty ?? true {
            UIView.animate(withDuration: Constants.animateDuration, delay: 0.0, options: .transitionCrossDissolve, animations: {
                self.placeNameErrorLabel.text = "PlaceName.Error.Empty".localized
                self.placeNameErrorLabel.isHidden = false
                self.placeNameTextField.layer.borderColor = UIColor.red.cgColor
                self.placeNameTextField.layer.masksToBounds = true
                self.placeNameTextField.layer.borderWidth = 1.0
                self.placeNameErrorLabel.alpha = 1
            })
        }
    }
    
    func configure(interactor: PlaceNameCellInteractor, title: String, value: String, isEditable: Bool) {
        self.interactor = interactor
        placeNameLabel.text = title
        placeNameTextField.text = value
        isUserInteractionEnabled = isEditable
    }
}
