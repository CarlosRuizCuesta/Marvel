//
//  MainViewController.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class MainViewController: UIViewController {

    @IBOutlet weak var searchBar : UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
}

extension MainViewController : UISearchBarDelegate {
    // When button "Search" pressed
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
        if let text = searchBar.searchTextField.text {
            if !text.isEmpty {
                MarvelApiHeroes(delegate: self, name: text).start()
            }
        }
    }
}


extension MainViewController : MarvelApiResponse {
    
    func response(hero: Hero) {
        DispatchQueue.main.async {
            let infoController = InfoController(nibName: "InfoController", bundle: nil)
            let navigation  = UINavigationController(rootViewController:infoController)
            infoController.hero = hero
            infoController.barTitle = hero.name
            navigation.modalPresentationStyle = .fullScreen
            navigation.modalTransitionStyle = .crossDissolve
            self.present(navigation, animated: true, completion: nil)
        }
    }
    
    func error(error : String) {
        print("fdsafdasf")
    }
}
