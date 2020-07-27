//
//  MainViewController.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var textField : UITextField!
    @IBOutlet weak var button : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button.addTarget(self, action: #selector(click_button), for: .touchUpInside)
        
        MarvelApiHeroes(delegate: self, name: "iron man").start()
        // Do any additional setup after loading the view.
    }
    
    @objc func click_button(sender : UIButton) {
        
        if let nombre = textField.text {
            if !nombre.isEmpty {
                MarvelApiHeroes(delegate: self, name: nombre).start()
            }
        }
        
    }
}


extension MainViewController : MarvelApiResponse {
    
    func response(hero: Hero) {
        DispatchQueue.main.async {
            let moreInfoControllerVC = MoreInfoController(nibName: "MoreInfoController", bundle: nil)
            let navigation  = UINavigationController(rootViewController:moreInfoControllerVC)
            navigation.modalPresentationStyle = .fullScreen
            navigation.modalTransitionStyle = .crossDissolve
            self.present(navigation, animated: true, completion: nil)
        }
    }
    
    func error(error : String) {
        print("fdsafdasf")
    }
}
