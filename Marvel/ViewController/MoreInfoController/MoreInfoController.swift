//
//  MoreInfoController.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 24/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import UIKit

class MoreInfoController: UIViewController {
    
    
    @IBOutlet weak var tblAppearance : UITableView!
    
    
    var barTitle : String!
    var appearance : Appearance!
    var tblData : [AppearanceItem] = []
    var alert : UIAlertController!
    
    var selectedName : String!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        self.title = barTitle
        tblAppearance .tableFooterView = UIView()
        addBackButton()
        setupData()
    }
    
    func setupData() {
        tblData = appearance.items
        tblAppearance.delegate = self
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

extension MoreInfoController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = self.tblData[indexPath.row]
        selectedName = section.name
        
        if let hero = RealmRepositories.getHero(name: self.selectedName) {
            presentHero(hero: hero)
        } else {
            self.alert = Utils.generateAlertControllerLoading(title: NSLocalizedString("Loading", comment: ""))
            self.present(self.alert, animated: true, completion: nil)
            MarvelApiAppearance(delegate: self, url: section.resourceURI).start()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tblData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
        
        let section = self.tblData[indexPath.row]

        cell.textLabel?.font = UIFont(name: "RobotoCondensed-Regular", size: 17)
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

extension MoreInfoController : MarvelApiResponse {
    func response(hero: Hero) {
        DispatchQueue.main.async {
            self.alert.dismiss(animated: true, completion: { () -> Void in
                self.presentHero(hero: hero)
            })
        }
    }
    
    func error(error: ErrorDetails) {
        DispatchQueue.main.async {
            self.alert.dismiss(animated: true, completion: { () -> Void in
                let alertController = Utils.generateAlertController(title: "Error", message: error.message)
                self.present(alertController, animated: true, completion: nil)
            })
        }
    }
    
    
}

