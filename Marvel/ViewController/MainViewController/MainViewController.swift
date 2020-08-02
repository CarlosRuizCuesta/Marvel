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
    //@IBOutlet weak var navigationBar : UINavigationBar!
    @IBOutlet weak var tblHeroes : UITableView!
    
    var selectedName : String!
    var alert : UIAlertController!
    var arrHeroes : [Hero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tblHeroes.tableFooterView = UIView()
        tblHeroes.delegate = self
        getData()
        
        if let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path {
            print("Documents directory \(documentPath)")
        }
    }
    
    func getData() {
        if let heroes = RealmRepositories.getHeroes() {
            self.arrHeroes = heroes
            self.tblHeroes.reloadData()
        }
    }
    
    func presentHero(hero : Hero) {
        let infoController = InfoController(nibName: "InfoController", bundle: nil)
        let navigation  = UINavigationController(rootViewController:infoController)
        infoController.hero = hero
        infoController.barTitle = hero.name
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
                if let hero = RealmRepositories.getHero(name: text) {
                    presentHero(hero: hero)
                } else {
                    self.alert = Utils.generateAlertControllerLoading(title: "Cargando")
                    self.present(self.alert, animated: true, completion: nil)
                    MarvelApiHeroes(delegate: self, name: text).start()
                }
            }
        }
    }
}

extension MainViewController : MarvelApiResponse {
    
    func response(hero: Hero) {
        DispatchQueue.main.async {
            self.alert.dismiss(animated: true, completion: { () -> Void in
                self.presentHero(hero: hero)
            })
        }
    }
    
    func error(error : ErrorDetails) {
        DispatchQueue.main.async {
            self.alert.dismiss(animated: true, completion: { () -> Void in
                let alertController = Utils.generateAlertController(title: "Error", message: error.message)
                self.present(alertController, animated: true, completion: nil)
            })
        }
    }
}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = self.arrHeroes[indexPath.row]
        self.selectedName = section.name
        
        presentHero(hero: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = arrHeroes.count
        
        if count <= 0 {
            tblHeroes.setNoDataPlaceholder("No hay favoritos")
        } else {
            tblHeroes.removeNoDataPlaceholder()
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
        
        let section = self.arrHeroes[indexPath.row]

        cell.textLabel?.text  = section.name
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
}
