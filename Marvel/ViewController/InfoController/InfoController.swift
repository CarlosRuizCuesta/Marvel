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

    let leftBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        return barButtonItem
    }()
    
    var hero : Hero!
    var from : String!
    var barTitle : String!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        tblInfo.delegate = self
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
                }
            }
        }
        
    }
    
    func completeNavigation() {
        self.title = self.barTitle
        addBackButton()
    }
    
    func addBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "back.png"), for: .normal)
        backButton.setTitle(from, for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.backAction(_:)), for: .touchUpInside)

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
       dismiss(animated: true, completion: nil)
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