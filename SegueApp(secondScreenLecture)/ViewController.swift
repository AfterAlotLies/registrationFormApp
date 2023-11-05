//
//  ViewController.swift
//  SegueApp(secondScreenLecture)
//
//  Created by Vyacheslav on 06.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var nameToLogin: UITextField!
    @IBOutlet weak var passwordToLogin: UITextField!
    
    @IBOutlet weak var errorRegLabel: UILabel!
    
    @IBOutlet weak var regLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameText.text = ""
        passwordText.text = ""
        nameToLogin.text = ""
        passwordToLogin.text = ""
        errorRegLabel.text = ""
        errorLabel.text = ""
    }
    
    @IBAction func regButton(_ sender: Any) {
        var countVariables : Int = 0
        if nameText.text != "" && nameText.text!.count >= 4 && nameText.text != (UserDefaults.standard.object(forKey: "name") as! String) {
            if passwordText.text != "" && passwordText.text!.count >= 4 {
                for passwordChar in passwordText.text! {
                    switch(passwordChar) {
                    case "!":
                        countVariables += 1
                        fallthrough
                    case "@":
                        countVariables += 1
                        fallthrough
                    case "#":
                        countVariables += 1
                        fallthrough
                    case "$":
                        countVariables += 1
                        fallthrough
                    case "%":
                        countVariables += 1
                    default:
                        countVariables = 0
                    }
                }
                if countVariables > 0 {
                    UserDefaults.standard.set(nameText.text!, forKey: "name")
                    UserDefaults.standard.set(passwordText.text!, forKey: "password")
                    performSegue(withIdentifier: "showRegInfo", sender: nil)
                } else {
                    alertMessage(titleInput: "Ошибка", messageInput: "Введите хотя бы один символ")
                }
            } else {
                alertMessage(titleInput: "Ошибка", messageInput: "Введите корректные значения")
            }
        } else {
            alertMessage(titleInput: "Ошибка", messageInput: "Введите корректные значения")
        }
    }
    
    @IBAction func enterButton(_ sender: Any) {
        let correctLogin = UserDefaults.standard.object(forKey: "name")
        let correctPassword = UserDefaults.standard.object(forKey: "password")
        if (correctLogin as? String) != nil && nameToLogin.text! == correctLogin as! String {
            if (correctPassword as? String) != nil && passwordToLogin.text! == correctPassword as! String {
                performSegue(withIdentifier: "showEnterInfo", sender: nil)
            } else {
                alertMessage(titleInput: "Ошибка", messageInput: "Неправильный логин или пароль")
            }
        } else {
            alertMessage(titleInput: "Ошибка", messageInput: "Неправильный логин или пароль")
        }
    }
    
    func alertMessage(titleInput : String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Вернуться к форме", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

