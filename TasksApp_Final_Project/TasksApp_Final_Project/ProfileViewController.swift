//
//  ProfileViewController.swift
//  TasksApp_Final_Project
//
//  Created by Robert on 11/15/18.
//  Copyright © 2018 Robert Vitali. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var account:[String] = ["Sign Out"]
    var setting:[String] = ["Temperature", "Night Mode"]
    var headerList:[String] = ["Account","Settings"]
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerList[section]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return account.count
        }
        else{
            return setting.count
        }
    }
    
    @IBOutlet weak var settingTableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        if indexPath.section == 0{
            cell.textLabel!.text = account[indexPath.row]
        }
        if indexPath.section == 1 {
            cell.textLabel!.text = setting[indexPath.row]
            //https://stackoverflow.com/questions/47038673/add-switch-in-uitableview-cell-in-swift for adding switch to table view cell
            let switchView = UISwitch(frame : .zero)
            switchView.setOn(false, animated: true)
            switchView.tag = indexPath.row
//            switchView.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
//            (self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selcted")
        if(indexPath.section == 0){
            GIDSignIn.sharedInstance().signOut()
            print("SIGN OUT")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SignIn") as! SignInViewController
            self.present(nextViewController, animated:true, completion:nil)
        }
    }
    
    func setupTableView(){
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//    @IBAction func signOutClicked(_ sender: Any) {
//        GIDSignIn.sharedInstance().signOut()
//        print("SIGN OUT")
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SignIn") as! SignInViewController
//        self.present(nextViewController, animated:true, completion:nil)
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
