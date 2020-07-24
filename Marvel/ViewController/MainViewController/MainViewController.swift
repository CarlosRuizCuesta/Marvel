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
        
        MarvelApiHeroes(name: "iron man").start()
        // Do any additional setup after loading the view.
    }
    
    @objc func click_button(sender : UIButton) {
        
        if let nombre = textField.text {
            if !nombre.isEmpty {
                MarvelApiHeroes(name: nombre).start()
            }
        }
        
    }
}
