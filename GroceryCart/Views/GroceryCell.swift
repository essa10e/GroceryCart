//
//  GroceryCell.swift
//  GroceryCart
//
//  Created by ESSA AL.
//

import UIKit

class GroceryCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpCellViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configGroceryCell(grocery: Grocery) {
        self.itemLabel.text = grocery.itemName
        self.noteLabel.text = grocery.note
        self.quantityLabel.text = "\(grocery.quantity)"
    }
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = navyBlueColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        return view
    }()
    
    let quantityLabel: UILabel = {
        let al = UILabel()
        al.translatesAutoresizingMaskIntoConstraints = false
        al.textColor = peachColor
        al.textAlignment = .center
        al.font = UIFont.boldSystemFont(ofSize: 30)
        return al
    }()
    
    let itemLabel: UILabel = {
        let il = UILabel()
        il.translatesAutoresizingMaskIntoConstraints = false
        il.textColor = peachColor
        il.font = UIFont.boldSystemFont(ofSize: 30)
        return il
    }()
    
    let noteLabel: UILabel = {
        let bl = UILabel()
        bl.translatesAutoresizingMaskIntoConstraints = false
        bl.textColor = peachColor
        bl.numberOfLines = 0
        bl.font = UIFont.systemFont(ofSize: 16)
        return bl
    }()
    
    func setUpCellViews() {
        addSubview(cellView)
        addSubview(quantityLabel)
        addSubview(itemLabel)
        addSubview(noteLabel)
        
        NSLayoutConstraint.activate([
            // UIView:
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            cellView.heightAnchor.constraint(equalToConstant: 70),
            
            quantityLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 5),
            quantityLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            quantityLabel.heightAnchor.constraint(equalToConstant: 30),
            quantityLabel.widthAnchor.constraint(equalToConstant: 40),
            
            itemLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 5),
            itemLabel.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 5),
            itemLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -5),
            itemLabel.heightAnchor.constraint(equalToConstant: 30),
            
            noteLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 5),
            noteLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 15),
            noteLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -5),
            noteLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: 2),

            
        ])
    }
}
