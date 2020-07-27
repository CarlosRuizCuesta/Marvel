//
//  MainViewController.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblDesc : UILabel!
    @IBOutlet weak var btnMoreInfo : UIButton!
    @IBOutlet weak var imageView : UIImageView!
    
    
    var hero : Hero!
    let leftBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        barButtonItem.tintColor = UIColor.red
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnMoreInfo.addTarget(self, action: #selector(click_button), for: .touchUpInside)
        searchBar.delegate = self
        setupData()
    }
    
    func setupData() {
        if let hero = hero {
            if !hero.name.isEmpty {
                searchBar.text = hero.name
            }
        }
    }
    
    func completeData() {
        showItems()
        lblName.text = hero.name
        lblDesc.text = hero.description
    }
    
    func showItems() {
        lblName.isHidden = false
        lblDesc.isHidden = false
        imageView.isHidden = false
        btnMoreInfo.isHidden = false
    }
    
    @objc func click_button(sender : UIButton) {
        let moreInfoControllerVC = MoreInfoController(nibName: "MoreInfoController", bundle: nil)
        let navigation  = UINavigationController(rootViewController:moreInfoControllerVC)
        moreInfoControllerVC.hero = hero
        navigation.modalPresentationStyle = .fullScreen
        navigation.modalTransitionStyle = .crossDissolve
        self.present(navigation, animated: true, completion: nil)
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
            self.hero = hero
            self.completeData()
        }
    }
    
    func error(error : String) {
        print("fdsafdasf")
    }
}
