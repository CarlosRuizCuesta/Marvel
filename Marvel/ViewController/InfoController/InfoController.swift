//
//  InfoController.swift
//  Marvel
//
//  Created by MIGUEL PEREZ SUBIAS on 27/07/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class InfoController: UIViewController {
    
    @IBOutlet weak var lblName : UILabel!
    @IBOutlet weak var lblDesc : UILabel!
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var tblInfo : UITableView!
    
    typealias complitionBlock = (() -> Void)
    var complition: complitionBlock!
    var hero : Hero!
    var from : String!
    var barTitle : String!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        tblInfo.delegate = self
        tblInfo.tableFooterView = UIView()
        completeNavigation()
        completeData()
    }

    
    func completeData() {
        //lblName.text = hero.name
        lblDesc.text = hero.description
        if let image = hero.image {
            Alamofire.request(image).responseImage { response in
                if let image = response.result.value {
                    self.imageView.image = image
                } else {
                    self.setDefaultImage()
                }
            }
        }
        
    }
    
    func completeNavigation() {
        self.title = self.barTitle
        lblName.text = self.barTitle
        addBackButton()
        addBarButton()
    }
    
    func setDefaultImage() {
        self.imageView.image = UIImage(named: "image-not-found.png")
    }
    
    func addBarButton() {
        if hero.from == .apiMarvel {
            addRightButton(systemName: "star")
        } else if hero.from == .database {
            addRightButton(systemName: "star.fill")
        }
    }
    
    func addBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "back.png"), for: .normal)
        backButton.setTitle(from, for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.backAction(_:)), for: .touchUpInside)

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    func addRightButton(systemName : String) {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(systemName: systemName, withConfiguration: .none), for: .normal)
        backButton.setTitle(from, for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.toogleSave(_:)), for: .touchUpInside)

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    func backComplition(mycomplition: @escaping complitionBlock) {
        complition = mycomplition
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        if let complition = complition {
            complition()
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toogleSave(_ sender : UIButton) {
        if hero.name == nil {
            hero.name = self.barTitle
        }
        
        if hero.from == .apiMarvel {
            hero.from = .database
            saveHero(hero: hero)
        } else if hero.from == .database {
            hero.from = .apiMarvel
            deleteHero(hero: hero)
        }
        
        addBarButton()
    }
    
    func deleteHero(hero : Hero) {
        RealmRepositories.deleteHero(hero : hero)
    }
    
    func saveHero(hero : Hero) {
        RealmRepositories.saveHero(hero: hero)
    }
}


extension InfoController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = self.hero.sectionAppearance()
        let hero = section[indexPath.row]
        
        let moreInfoController = MoreInfoController(nibName: "MoreInfoController", bundle: nil)
        let navigation  = UINavigationController(rootViewController:moreInfoController)
        moreInfoController.appearance = hero
        moreInfoController.barTitle = hero.getType()
        navigation.modalPresentationStyle = .fullScreen
        navigation.modalTransitionStyle = .crossDissolve
        self.present(navigation, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hero.sectionAppearance().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
        
        let section = self.hero.sectionAppearance()
        
        cell.textLabel?.text  = section[indexPath.row].getType()
        cell.accessoryType = .disclosureIndicator
        
         return cell
    }
}
