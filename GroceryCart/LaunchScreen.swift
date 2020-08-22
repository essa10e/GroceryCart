//
//  LaunchScreen.swift
//  GroceryCart
//
//  Created by ESSA AL.
//

import UIKit

class LaunchScreen: UIViewController {
    
    // MARK:- LaunchScreen Logo:
    private let launchLogoImageView: UIImageView = {
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        logo.image = UIImage(named: "groceryCartAppIcon")
        
        return logo
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LaunchScreen")
        view.backgroundColor = UIColor(red: 249/255, green: 181/255, blue: 70/255, alpha: 1)
        view.addSubview(launchLogoImageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        launchLogoImageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.animateLaunchLogo()
        })
        
    }
    
    private func animateLaunchLogo() {
        
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 2
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            
            self.launchLogoImageView.frame = CGRect(x: -(diffX / 2), y: (diffY / 2), width: size, height: size)
        })
        
        UIView.animate(withDuration: 1.5, animations: {
            self.launchLogoImageView.alpha = 0
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                    let vc = ViewController()
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                })
            }
        })
        
        
    }
}
