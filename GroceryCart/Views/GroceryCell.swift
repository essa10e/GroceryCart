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
        self.brandLabel.text = grocery.brandName
    }
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 44/255, green: 57/255, blue: 95/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let itemLabel: UILabel = {
        let il = UILabel()
        il.translatesAutoresizingMaskIntoConstraints = false
        il.textColor = .white
        return il
    }()
    
    let brandLabel: UILabel = {
        let bl = UILabel()
        bl.translatesAutoresizingMaskIntoConstraints = false
        bl.textColor = .white
        return bl
    }()
    
    func setUpCellViews() {
        addSubview(cellView)
        addSubview(itemLabel)
        addSubview(brandLabel)
        
        NSLayoutConstraint.activate([
            // UIView:
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            cellView.heightAnchor.constraint(equalToConstant: 80),
            
            itemLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 5),
            itemLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 5),
            itemLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -5),
            itemLabel.heightAnchor.constraint(equalToConstant: 20),
            
            brandLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 5),
            brandLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 5),
            brandLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -5),
            brandLabel.heightAnchor.constraint(equalToConstant: 20),

            
            ])
    }
}
