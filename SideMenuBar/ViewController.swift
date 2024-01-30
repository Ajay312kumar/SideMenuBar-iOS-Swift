//
//  ViewController.swift
//  SideMenuBar
//
//  Created by Ajay Kumar on 30/01/24.
//

import UIKit

class ViewController: UIViewController {

    //MARK: variables
    
    var sideBarView: UIView!
    var tableView:UITableView!
    var isEnableSideBarView:Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        var menuBtn = UIBarButtonItem(title:"Menu", style: .done, target: self, action: #selector(menuBtnClick))
        self.navigationItem.leftBarButtonItem = menuBtn
        
        sideBarView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height))
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.bounds.height))
        
        self.view.addSubview(sideBarView)
        self.sideBarView.addSubview(tableView)
    }

    
    @objc func menuBtnClick() {
        print("btn click")
        
        if isEnableSideBarView {

           // UIView.animate(withDuration: 0.5){
                self.sideBarView.frame = CGRect(x: self.view.bounds.width, y: 50, width: 0, height: self.view.bounds.height)
                self.tableView.frame = CGRect(x: 0, y: 50, width: 0, height: self.view.bounds.height)
                self.isEnableSideBarView = false
          //  }
        } else {
            // Show the side menu by bringing it on-screen
            
         //   UIView.animate(withDuration: 0.5){
                self.sideBarView.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width/1.5, height: self.view.bounds.height)
                self.tableView.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width/1.5, height: self.view.bounds.height)
                self.isEnableSideBarView = true
          //  }
        }
    }



}

