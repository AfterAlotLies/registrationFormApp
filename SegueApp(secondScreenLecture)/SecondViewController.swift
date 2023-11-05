//
//  SecondViewController.swift
//  SegueApp(secondScreenLecture)
//
//  Created by Vyacheslav on 06.10.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    var loginDB : String = ""
    var passwordDB : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showRegDB(_ sender: Any) {
        loginDB = UserDefaults.standard.object(forKey: "name") as! String
        passwordDB = UserDefaults.standard.object(forKey: "password") as! String
        performSegue(withIdentifier: "showInfo1", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInfo1" {
            let destinationShowInfo1 = segue.destination as! FourthViewController
            destinationShowInfo1.loginText = loginDB
            destinationShowInfo1.passwordText = passwordDB
        }
    }
}
