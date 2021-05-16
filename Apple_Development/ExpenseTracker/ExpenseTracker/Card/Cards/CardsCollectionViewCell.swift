//
//  AddCardCollectionViewCell.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 18/01/21.
//

import UIKit

class CardsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var _cardCvvText: UILabel!
    @IBOutlet weak var _cardNameText: UILabel!
    @IBOutlet weak var _creditLimitText: UILabel!
    @IBOutlet weak var _cardNumberLabel: UILabel!
    
    @IBOutlet weak var _selectedLabel: UILabel!
    @IBOutlet weak var _validThroughLabel: UILabel!
    
    var isEditing : Bool = false{
        didSet
        {
            _selectedLabel.isHidden = !isEditing
        }
    }
    
    
    override var isSelected: Bool
    {
        didSet
        {
            if (isEditing)
            {
                _selectedLabel.text = isSelected ? "✔︎" : ""
            }
        }
    }
    
    func setup(card : Card) {
        
        _cardNameText.text = card.cardName
        _creditLimitText.text = "\(card.creditLimit)"
       cardImageView.image = UIImage(data: card.cardImage!)
       _cardCvvText.text = "\(card.cvv)"
        let cardNumber = arrangeUSFormat(strPhone: "\(card.cardNumber!)")
        _cardNumberLabel.text = cardNumber
        let components = Calendar.current.dateComponents([.day, .year, .month], from: card.expiryDate!)
        if let day = components.day, let month = components.month, let year = components.year {
            _validThroughLabel.text = "\(month)/\(year)"
            
            print("day: \(day), month: \(month), year: \(year)")
        }
            DateFormatter().string(from: card.expiryDate!)
    }
    
    func arrangeUSFormat(strPhone : String)-> String {
        var strUpdated = strPhone
        if strPhone.count == 16 {
            //strUpdated.insert("(", at: strUpdated.startIndex)
            strUpdated.insert("-", at: strUpdated.index(strUpdated.startIndex, offsetBy: 4))
            strUpdated.insert("-", at: strUpdated.index(strUpdated.startIndex, offsetBy: 9))
            strUpdated.insert("-", at: strUpdated.index(strUpdated.startIndex, offsetBy: 14))
        }
        return strUpdated
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        layer.shadowOpacity = 1
        layer.shadowOffset=CGSize(width: 1, height: 1)
        
        self._selectedLabel.layer.cornerRadius = 15
        self._selectedLabel.layer.masksToBounds = true
        self._selectedLabel.layer.borderColor = UIColor.white.cgColor
        self._selectedLabel.layer.borderWidth = 1
        self._selectedLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        _selectedLabel.isHidden = !isEditing
    }
}
