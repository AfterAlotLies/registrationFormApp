//
//  ThirdViewController.swift
//  SegueApp(secondScreenLecture)
//
//  Created by Vyacheslav on 06.10.2023.
//

import UIKit

class ThirdViewController: UIViewController {

    var loginDB : String = ""
    var passwordDB : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func showInfoDB2(_ sender: Any) {
        loginDB = UserDefaults.standard.object(forKey: "name") as! String
        passwordDB = UserDefaults.standard.object(forKey: "password") as! String
        performSegue(withIdentifier: "showInfo2", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showInfo2" {
            let destinationShowInfo2 = segue.destination as! FourthViewController
            destinationShowInfo2.loginText = loginDB
            destinationShowInfo2.passwordText = passwordDB
        }
    }
}
