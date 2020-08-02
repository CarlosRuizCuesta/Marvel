//
//  FavoritesVC.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 29/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController {
    
    @IBOutlet weak var tblHeroes : UITableView!
    
    var selectedName : String!
    var arrHeroes : [Hero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        completeNavigation()
        getData()
        // Do any additional setup after loading the view.
        
    }
    
    func getData() {
        if let heroes = RealmRepositories.getHeroes() {
            self.arrHeroes = heroes
            self.tblHeroes.reloadData()
        }
    }
    
    func completeNavigation() {
        self.title = "Favoritos"
        addBackButton()
    }
    
    func addBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "back.png"), for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.backAction(_:)), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
       dismiss(animated: true, completion: nil)
    }
}



extension FavoritesVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = self.arrHeroes[indexPath.row]
        selectedName = section.name
        
        presentHero(hero: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHeroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
        
        let section = self.arrHeroes[indexPath.row]

        cell.textLabel?.text  = section.name
        
         return cell
    }
    
    func presentHero(hero : Hero) {
        let infoController = InfoController(nibName: "InfoController", bundle: nil)
        let navigation  = UINavigationController(rootViewController:infoController)
        infoController.hero = hero
        infoController.barTitle = self.selectedName
        navigation.modalPresentationStyle = .fullScreen
        navigation.modalTransitionStyle = .crossDissolve
        self.present(navigation, animated: true, completion: nil)
    }
}
