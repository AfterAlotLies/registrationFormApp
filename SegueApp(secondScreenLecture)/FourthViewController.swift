//
//  FourthViewController.swift
//  SegueApp(secondScreenLecture)
//
//  Created by Vyacheslav on 06.10.2023.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var outputLogin: UILabel!
    @IBOutlet weak var outputPassword: UILabel!
    
    var loginText : String = ""
    var passwordText : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLogin.text = "Ваш логин: \(loginText)"
        outputPassword.text = "Ваш пароль: \(passwordText)"
        // Do any additional setup after loading the view.
    }
}
