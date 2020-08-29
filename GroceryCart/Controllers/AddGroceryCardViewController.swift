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
        iLabel.textAlignment = .center
        iLabel.font = UIFont.boldSystemFont(ofSize: 50)
        iLabel.textColor = .white
        return iLabel
    }()
    
    fileprivate let itemNameLabel: UILabel = {
        let iLabel = UILabel()
        iLabel.translatesAutoresizingMaskIntoConstraints = false
        iLabel.text = "Item"
        iLabel.textColor = navyBlueColor
        iLabel.font = UIFont.boldSystemFont(ofSize: 30)
        iLabel.backgroundColor = .lightGray
        return iLabel
    }()
    
    let itemNameTextField: UITextField = {
        let iTextField = UITextField()
        iTextField.translatesAutoresizingMaskIntoConstraints = false
        iTextField.placeholder = "Item name..."
        iTextField.borderStyle = .bezel
        iTextField.layer.borderColor = navyBlueColor.cgColor
        return iTextField
    }()
    
    let quantityLabel: UILabel = {
        let qLabel = UILabel()
        qLabel.translatesAutoresizingMaskIntoConstraints = false
        qLabel.text = "Quantity"
        qLabel.textColor = navyBlueColor
        qLabel.font = UIFont.boldSystemFont(ofSize: 30)
        qLabel.backgroundColor = .lightGray
        return qLabel
    }()
    
    let quantityStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.minimumValue = 1
        stepper.maximumValue = 45
        //stepper.autorepeat = false
        stepper.isContinuous = false
        stepper.tintColor = navyBlueColor
        stepper.addTarget(self, action: #selector(stepperValue), for: .touchUpInside)
        return stepper
    }()
    
    @objc func stepperValue(_ sender: UIStepper) {
        quantityStepperLabel.text = "\(Int(sender.value))"
    }
    
    let quantityStepperLabel: UILabel = {
        let sLabel = UILabel()
        sLabel.translatesAutoresizingMaskIntoConstraints = false
        sLabel.text = "1"
        sLabel.textAlignment = .center
        sLabel.font = UIFont.boldSystemFont(ofSize: 30)
        sLabel.backgroundColor = .lightGray
        sLabel.layer.masksToBounds = true
        sLabel.layer.borderWidth = 1
        sLabel.layer.borderColor = navyBlueColor.cgColor
        return sLabel
    }()
    
    fileprivate let noteLabel: UILabel = {
        let iLabel = UILabel()
        iLabel.translatesAutoresizingMaskIntoConstraints = false
        iLabel.text = "Note"
        iLabel.textColor = navyBlueColor
        iLabel.font = UIFont.boldSystemFont(ofSize: 30)
        iLabel.backgroundColor = .lightGray
        return iLabel
    }()
    
    let noteTextField: UITextField = {
        let nTextField = UITextField()
        nTextField.translatesAutoresizingMaskIntoConstraints = false
        nTextField.placeholder = "Any specific detail..."
        nTextField.borderStyle = .bezel
        nTextField.layer.borderColor = navyBlueColor.cgColor
        return nTextField
    }()
    
    let submitBtn: UIButton = {
        let sBtn = UIButton()
        sBtn.translatesAutoresizingMaskIntoConstraints = false
        sBtn.setTitle("Submit", for: .normal)
        sBtn.backgroundColor = UIColor(red: 0/255, green: 160/255, blue: 0/255, alpha: 1)
        return sBtn
    }()
    
    let cancelBtn: UIButton = {
        let cBtn = UIButton()
        cBtn.translatesAutoresizingMaskIntoConstraints = false
        cBtn.setTitle("Cancel", for: .normal)
        cBtn.backgroundColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
        cBtn.addTarget(self, action: #selector(cancelGroceryItem), for: .touchUpInside)
        return cBtn
    }()
    
    @objc func cancelGroceryItem() {
        self.dismiss(animated: true)
        self.itemNameTextField.text?.removeAll()
        self.noteTextField.text?.removeAll()
        self.quantityStepperLabel.text = "1"
        self.quantityStepper.value = 1.0
    }
    
    // MARK:- Set Up Views
    func setupViews() {
        view.addSubview(cardView)
        cardView.addSubview(cardViewHandleArea)
        cardViewHandleArea.addSubview(titleLabel)
        
        cardView.addSubview(itemNameLabel)
        cardView.addSubview(itemNameTextField)
        
        cardView.addSubview(noteLabel)
        cardView.addSubview(noteTextField)
        
        cardView.addSubview(quantityLabel)
        cardView.addSubview(quantityStepper)
        cardView.addSubview(quantityStepperLabel)
        
        cardView.addSubview(submitBtn)
        cardView.addSubview(cancelBtn)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            // CardViewHandleArea:
            cardViewHandleArea.topAnchor.constraint(equalTo: cardView.safeAreaLayoutGuide.topAnchor, constant: 2),
            cardViewHandleArea.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 2),
            cardViewHandleArea.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -2),
            cardViewHandleArea.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: cardViewHandleArea.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: cardViewHandleArea.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: cardViewHandleArea.trailingAnchor, constant: -5),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            
            itemNameLabel.topAnchor.constraint(equalTo: cardViewHandleArea.bottomAnchor, constant: 10),
            itemNameLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            itemNameLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            itemNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            itemNameTextField.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 10),
            itemNameTextField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            itemNameTextField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            itemNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            
            noteLabel.topAnchor.constraint(equalTo: itemNameTextField.bottomAnchor, constant: 10),
            noteLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            noteLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            noteLabel.heightAnchor.constraint(equalToConstant: 40),
            
            noteTextField.topAnchor.constraint(equalTo: noteLabel.bottomAnchor, constant: 10),
            noteTextField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            noteTextField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            noteTextField.heightAnchor.constraint(equalToConstant: 50),
        
            quantityLabel.topAnchor.constraint(equalTo: noteTextField.bottomAnchor, constant: 10),
            quantityLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            quantityLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            quantityLabel.heightAnchor.constraint(equalToConstant: 40),
            
            quantityStepperLabel.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 10),
            quantityStepperLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            quantityStepperLabel.widthAnchor.constraint(equalToConstant: 70),
            quantityStepperLabel.heightAnchor.constraint(equalToConstant: 70),
            
            quantityStepper.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 10),
            //quantityStepper.leadingAnchor.constraint(equalTo: quantityStepperLabel.trailingAnchor, constant: 5),
            quantityStepper.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            quantityStepper.widthAnchor.constraint(equalToConstant: 100),
            quantityStepper.heightAnchor.constraint(equalToConstant: 100),
            
            
            
            
            // Submit Button:
            submitBtn.topAnchor.constraint(equalTo: quantityStepper.bottomAnchor, constant: 10),
            submitBtn.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            submitBtn.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            submitBtn.heightAnchor.constraint(equalToConstant: 50),
            
            // Cancel Button:
            cancelBtn.topAnchor.constraint(equalTo: submitBtn.bottomAnchor, constant: 10),
            cancelBtn.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 5),
            cancelBtn.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -5),
            cancelBtn.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}
