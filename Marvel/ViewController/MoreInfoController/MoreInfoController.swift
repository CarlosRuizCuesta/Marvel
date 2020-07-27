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
    
    var hero : Hero!
    var sectionsppearance : [Appearance] = []
    
    let leftBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        barButtonItem.tintColor = UIColor.red
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        self.title = hero.name
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        setupData()
    }
    
    func setupData() {
        sectionsppearance = hero.sectionAppearance()
        tblAppearance.delegate = self
    }
}

extension MoreInfoController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = self.sectionsppearance[indexPath.section]
        let hero = section.items[indexPath.row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsppearance.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sectionsppearance[section]
        return section.getType()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sectionsppearance[section]
        return section.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mycell")
        
        let section = self.sectionsppearance[indexPath.section]
        let hero = section.items[indexPath.row]
        
        cell.textLabel?.text  = hero.name
        
         return cell
    }
}
