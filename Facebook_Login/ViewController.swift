//
//  ViewController.swift
//  Facebook_Login
//
//  Created by Robert Shrestha on 5/2/18.
//  Copyright © 2018 Robert Shrestha. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FacebookShare

class ViewController: UIViewController {
    let loginManager = LoginManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        
        view.addSubview(loginButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        loginManager.logIn(readPermissions: [.email,.publicProfile,.userGender,.userBirthday], viewController: self) { (loginResult) in
            print(loginResult)
            
            switch loginResult{
            case .cancelled:
                print("User cancalled Login.")
            case .failed(let error):
                print(error.localizedDescription)
            case .success(grantedPermissions: let granted, declinedPermissions:let declined, token: let token):
                print(token.userId as Any)
                print(declined)
                print(granted)
                let req = GraphRequest(graphPath: "me", parameters: ["fields":"email,name,birthday,gender,picture.width(100).height(100)"], accessToken: token, httpMethod: GraphRequestHTTPMethod(rawValue: "GET")!, apiVersion: .defaultVersion)
                req.start({ (response, value) in
                    switch value{
                    case .success(let value):
                        print(value.dictionaryValue as Any)
                        let data = value.dictionaryValue ?? [:]
                        print(data["name"] ?? "")
                        print(data["email"] ?? "")
                        print(data["picture"] ?? [:])
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                        vc.userData = data
                        self.present(vc, animated: true, completion: nil)
                    case .failed(let error):
                        print(error)
                    }
                })
                
            }
        }
        
    }

    }
