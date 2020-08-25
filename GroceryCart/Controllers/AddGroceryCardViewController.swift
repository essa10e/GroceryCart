//
//  AddGroceryCardViewController.swift
//  GroceryCart
//
//  Created by ESSA AL.
//

import UIKit

class AddGroceryCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    fileprivate let cardView: UIView = {
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = peachColor
        card.layer.cornerRadius = 5
        
        return card
    }()
    
    fileprivate let cardViewHandleArea: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = navyBlueColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    fileprivate let cardViewHandleShape: UIView = {
        let handle = UIView()
        handle.translatesAutoresizingMaskIntoConstraints = false
        handle.backgroundColor = .white
        handle.layer.cornerRadius = 5
        return handle
    }()
    
    fileprivate let titleLabel: UILabel = {
        let iLabel = UILabel()
        iLabel.translatesAutoresizingMaskIntoConstraints = false
        iLabel.text = "Add New Item"
        iLabel.font = UIFont.boldSystemFont(ofSize: 50)
        iLabel.textColor = navyBlueColor
        return iLabel
    }()
    
    fileprivate let itemNameLabel: UILabel = {
        let iLabel = UILabel()
        iLabel.translatesAutoresizingMaskIntoConstraints = false
        iLabel.text = "Item:"
        iLabel.textColor = navyBlueColor
        iLabel.font = UIFont.boldSystemFont(ofSize: 30)
        return iLabel
    }()
    
    let itemNameTextField: UITextField = {
        let iTextField = UITextField()
        iTextField.translatesAutoresizingMaskIntoConstraints = false
        iTextField.text = ".."
        
        return iTextField
    }()
    
    let amountLabel: UILabel = {
        let alabel = UILabel()
        alabel.translatesAutoresizingMaskIntoConstraints = false
        alabel.text = "Amount:"
        alabel.textColor = navyBlueColor
        return alabel
    }()
    
    fileprivate let noteLabel: UILabel = {
        let iLabel = UILabel()
        iLabel.translatesAutoresizingMaskIntoConstraints = false
        iLabel.text = "Note:"
        iLabel.textColor = navyBlueColor
        iLabel.font = UIFont.boldSystemFont(ofSize: 30)
        return iLabel
    }()
    
    let noteTextField: UITextField = {
        let nTextField = UITextField()
        nTextField.translatesAutoresizingMaskIntoConstraints = false
        nTextField.text = "..."
        nTextField.backgroundColor = .brown
        return nTextField
    }()
    
    let submitBtn: UIButton = {
        let sBtn = UIButton()
        sBtn.translatesAutoresizingMaskIntoConstraints = false
        sBtn.setTitle("Submit", for: .normal)
        sBtn.backgroundColor = .red
        return sBtn
    }()
    
    // MARK:- Set Up Views
    func setupViews() {
        view.addSubview(cardView)
        cardView.addSubview(cardViewHandleArea)
        cardViewHandleArea.addSubview(cardViewHandleShape)
        cardView.addSubview(titleLabel)
        cardView.addSubview(itemNameLabel)
        cardView.addSubview(itemNameTextField)
        cardView.addSubview(noteLabel)
        cardView.addSubview(noteTextField)
        cardView.addSubview(submitBtn)
        
        
        NSLayoutConstraint.activate([
            // CardView:
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            // CardViewHandleArea:
            cardViewHandleArea.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 0),
            cardViewHandleArea.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 0),
            cardViewHandleArea.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 0),
            cardViewHandleArea.heightAnchor.constraint(equalToConstant: 60),
            // CardViewHandleShape:
            cardViewHandleShape.topAnchor.constraint(equalTo: cardViewHandleArea.topAnchor, constant: 5),
            cardViewHandleShape.centerXAnchor.constraint(equalTo: cardViewHandleArea.centerXAnchor),
            cardViewHandleShape.centerYAnchor.constraint(equalTo: cardViewHandleArea.centerYAnchor),
            //cardViewHandleShape.heightAnchor.constraint(equalToConstant: 5),
            cardViewHandleShape.widthAnchor.constraint(equalToConstant: 30),
            // Title Label:
            titleLabel.topAnchor.constraint(equalTo: cardViewHandleArea.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            titleLabel.heightAnchor.constraint(equalToConstant: 35),
            
            // Item Name Label:
            itemNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            itemNameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            //itemNameLabel.trailingAnchor.constraint(equalTo: topAnchor, constant: 5),
            itemNameLabel.widthAnchor.constraint(equalToConstant: 65),
            itemNameLabel.heightAnchor.constraint(equalToConstant: 35),
            
            // Item Name TextField:
            itemNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            itemNameTextField.leadingAnchor.constraint(equalTo: itemNameLabel.trailingAnchor, constant: 5),
            itemNameTextField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            itemNameTextField.heightAnchor.constraint(equalToConstant: 35),
            
            // Note Label:
            noteLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 5),
            noteLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            //noteLabel.trailingAnchor.constraint(equalTo: topAnchor, constant: 5),
            noteLabel.widthAnchor.constraint(equalToConstant: 65),
            noteLabel.heightAnchor.constraint(equalToConstant: 35),
            
            // Note TextField:
            noteTextField.topAnchor.constraint(equalTo: itemNameTextField.bottomAnchor, constant: 5),
            noteTextField.leadingAnchor.constraint(equalTo: noteLabel.trailingAnchor, constant: 5),
            noteTextField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            noteTextField.heightAnchor.constraint(equalToConstant: 35),
            
            // Submit Button:
            submitBtn.topAnchor.constraint(equalTo: noteTextField.bottomAnchor, constant: 10),
            submitBtn.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            submitBtn.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            //submitBtn.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 5),
            //submitBtn.widthAnchor.constraint(equalToConstant: 100),
            submitBtn.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    

}
