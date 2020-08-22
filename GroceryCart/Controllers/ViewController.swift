//
//  ViewController.swift
//  GroceryCart
//
//  Created by ESSA AL on 8/20/20.
//  Copyright © 2020 ESSA ALDOWAIHES. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "GroceryCart"
        title.textColor = UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1)
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 55)
        //title.backgroundColor = UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1)
        return title
    }()
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1)
        //tv.separatorStyle = .none
        tv.allowsSelection = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewConstroller")
        view.backgroundColor = UIColor(red: 249/255, green: 181/255, blue: 70/255, alpha: 1)
        
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        
        tableView.register(ItemsCell.self, forCellReuseIdentifier: "cell")
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 70),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 5)
            
        ])
        
    }

   

}






// MARK:- tableview cell:
class ItemsCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpCellViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 44/255, green: 57/255, blue: 95/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setUpCellViews() {
        addSubview(cellView)
        NSLayoutConstraint.activate([
            // UIView:
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            cellView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
