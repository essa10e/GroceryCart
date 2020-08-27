//
//  ViewController.swift
//  GroceryCart
//
//  Created by ESSA AL.
//

import UIKit
import CoreData

let grocery_cell_id = "groceryCell"

let navyBlueColor = UIColor(red: 44/255, green: 57/255, blue: 95/255, alpha: 1)
let peachColor = UIColor(red: 249/255, green: 181/255, blue: 70/255, alpha: 1)

class GroceryViewController: UIViewController {
    
    var groceryMO: [GroceryMO] = []

    // groceryTableView reference dataSource:
    var dataService = GroceryCartDataService()    
    var groceryManager = GroceryManager()
    let cardView = AddGroceryCardViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = peachColor
        
        groceryTableView.register(GroceryCell.self, forCellReuseIdentifier: grocery_cell_id)
        
        self.groceryTableView.delegate = dataService
        self.groceryTableView.dataSource = dataService
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(titleLabel)
        view.addSubview(groceryTableView)
        view.addSubview(addBtn)
        
        addBtn.layer.cornerRadius = addBtn.frame.width / 2
        addBtn.layer.borderWidth = 2
        addBtn.layer.borderColor = navyBlueColor.cgColor
        addBtn.layer.masksToBounds = true
        addBtn.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 70),
            
            groceryTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            groceryTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            groceryTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            groceryTableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0),
            
            addBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            addBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            addBtn.heightAnchor.constraint(equalToConstant: 70),
            addBtn.widthAnchor.constraint(equalToConstant: 70),
            
            ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<GroceryMO>(entityName: "GroceryDB")
        
        do {
            
            groceryMO = try managedContext.fetch(fetchRequest)
            
            print("\(groceryMO.count)")
            print("\(groceryMO)")
            
            print("-----------------------------")
            for i in groceryMO {
//                print("\(i.itemName)")
//                print("\(i.note)")
//                print("\(i.quantity)")
                self.dataService.groceryManager?.addGrocery(grocery: Grocery(itemName: i.itemName!, note: i.note!, quantity: Int(i.quantity)))
                
            }
            
            groceryTableView.reloadData()
            
        } catch let error as NSError {
            print("failed to fetch data", error)
        }
    }
    
    
    
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "GroceryCart"
        title.textColor = navyBlueColor
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 55)

        return title
    }()
    
    let groceryTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.separatorStyle = .none
        tv.layer.cornerRadius = 10
        tv.showsVerticalScrollIndicator = false
        tv.sectionHeaderHeight = 50
        
        return tv
    }()
    
    let addBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("+", for: .normal)
        btn.setTitleColor(navyBlueColor, for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 70)
        btn.backgroundColor = peachColor
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        btn.addTarget(self, action: #selector(addGroceryItem), for: .touchUpInside)
        return btn
    }()
    
    @objc func addGroceryItem() {
        dataService.groceryManager = groceryManager
        
        cardView.modalPresentationStyle = .pageSheet
        self.present(cardView, animated: true)
        
        cardView.submitBtn.addTarget(self, action: #selector(submitOneItem), for: .touchUpInside)
    }
    
    @objc func submitOneItem() {
        self.dismiss(animated: true) {
            let _itemName = self.cardView.itemNameTextField.text
            let _note = self.cardView.noteTextField.text
            //let _quantity = "\(self.cardView.amountLabel.text)"
    
            self.cardView.itemNameTextField.text?.removeAll()
            self.cardView.noteTextField.text?.removeAll()
            
            self.dataService.groceryManager?.addGrocery(grocery: Grocery(itemName: _itemName!, note: _note))
            self.groceryTableView.reloadData()
            
            self.saveGroceryToDB(itemName: _itemName!, note: _note!)
        }
    }
    
    
    
    // MARK:- Save to CoreData
    func saveGroceryToDB(itemName: String, note: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "GroceryDB" , in: managedContext)
        let itemm = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        itemm.setValue(itemName, forKey: "itemName")
        itemm.setValue(note, forKey:"note")
        
        let b = itemm.value(forKey: "note")
        print(b!)
        print(itemm)
        do {
            try managedContext.save()
            groceryMO.append(itemm as! GroceryMO)
        } catch let error as NSError {
            print("saveGroceryToDB() -- failed to save item", error)
        }
    }
    
    
    
}
