//
//  ViewController.swift
//  GroceryCart
//
//  Created by ESSA AL.
//

import UIKit

let grocery_cell_id = "groceryCell"

class GroceryViewController: UIViewController {
    
    // groceryTableView reference dataSource:
    var dataService = GroceryCartDataService()
    
    var groceryManager = GroceryManager()
    
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "GroceryCart"
        title.textColor = UIColor(red: 44/255, green: 57/255, blue: 95/255, alpha: 1)
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 55)
        //title.backgroundColor = UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1)
        return title
    }()
    
    let groceryTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor(red: 44/255, green: 57/255, blue: 95/255, alpha: 1)
        //tv.separatorStyle = .none
        tv.layer.cornerRadius = 10
        tv.allowsSelection = false
        return tv
    }()
    
    let addBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = btn.frame.width / 2
        //btn.layer.masksToBounds = true
        btn.clipsToBounds = true
        btn.backgroundColor = UIColor(red: 249/255, green: 181/255, blue: 70/255, alpha: 1)
        btn.addTarget(self, action: #selector(addGroceryItem), for: .touchUpInside)
        return btn
    }()
    
    @objc func addGroceryItem() {
        print("item btn")
        dataService.groceryManager = groceryManager
        dataService.groceryManager?.addGrocery(grocery: Grocery(itemName: "Item Added", brandName: "Test ONLY"))
        groceryTableView.reloadData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewConstroller")
        view.backgroundColor = UIColor(red: 249/255, green: 181/255, blue: 70/255, alpha: 1)
        
        
        view.addSubview(titleLabel)
        view.addSubview(groceryTableView)
        view.addSubview(addBtn)
        
        groceryTableView.register(GroceryCell.self, forCellReuseIdentifier: grocery_cell_id)
        
        self.groceryTableView.delegate = dataService //self
        self.groceryTableView.dataSource = dataService //self
        
        // * Dummy Data *
        dataService.groceryManager = groceryManager
        dataService.groceryManager?.addGrocery(grocery: Grocery(itemName: "Pizza", brandName: "PizzaHut"))
        dataService.groceryManager?.addGrocery(grocery: Grocery(itemName: "Hand Soap", brandName: "Hawai Soa"))
        dataService.groceryManager?.addGrocery(grocery: Grocery(itemName: "Soft Drink", brandName: "Pepsi"))
        dataService.groceryManager?.addGrocery(grocery: Grocery(itemName: "Orange", brandName: "Lakeers"))
        dataService.groceryManager?.addGrocery(grocery: Grocery(itemName: "Kiwi", brandName: "Lakeers"))
        dataService.groceryManager?.addGrocery(grocery: Grocery(itemName: "Chips", brandName: "Laysssss"))
        groceryTableView.reloadData()
        
        
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 70),
            
            groceryTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            groceryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            groceryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            groceryTableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -2),
            
            addBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            addBtn.heightAnchor.constraint(equalToConstant: 70),
            addBtn.widthAnchor.constraint(equalToConstant: 70),
            
        ])
        
    }

}
