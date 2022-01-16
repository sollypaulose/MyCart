//
//  MyCartViewController.swift
//  MyCart
//
//  Created by Solly Paulose on 12/01/22.
//

import UIKit

class MyCartViewController: UIViewController {
    
    @IBOutlet weak var MyCartLabel: UILabel!
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordLabel: UILabel!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LogInButton: UIButton!
    
    var username : [String]?
    var password : [String]?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        UsernameTextField.delegate = self
        PasswordTextField.delegate = self
        self.username = [String]()
        self.password = [String]()
        // Do any additional setup after loading the view.
    }

    @IBAction func LogInButtonClicked(_ sender: Any) {
        
        if self.UsernameTextField.text != "" && self.PasswordTextField.text != ""{
        let nextVc = (self.storyboard?.instantiateViewController(identifier: "WishListViewController"))! as WishListViewController
        self.navigationController?.pushViewController(nextVc, animated: true)
        }
    }
    
}

extension MyCartViewController : UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField){
        if textField.text != ""{
        let usernameInput = UsernameTextField.text
            if self.username?.contains(usernameInput!) == true{
                textField.text = ""
                print("Try another Username")
                let alertUsername = UIAlertController(title: nil, message: "Try another Username", preferredStyle: .alert)
                self.present(alertUsername, animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            }else{
            self.username?.append(usernameInput!)
            print("username",username)
            }
        let passwordInput = PasswordTextField.text
            if self.password?.contains(passwordInput!) == true{
                        textField.text = ""
                print("Try another Password")
                let alertPassword = UIAlertController(title: nil, message: "Try another Password", preferredStyle: .alert)
                self.present(alertPassword, animated: true, completion: nil)
                self.dismiss(animated: true, completion: nil)
            }else{
                self.password?.append(passwordInput!)
                print("Password",password)
                }
     }
    }
}

