//
//  ViewController.swift
//  GNIT Library System
//
//  Created by Arindam Santra on 08/09/21.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
        if let urlFromStr = URL(string: "companyportal://") {
            if UIApplication.shared.canOpenURL(urlFromStr) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(urlFromStr, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(urlFromStr)
                }
            }
            else{
                print("Not working")
            }
        }
        else{
            print("Not working2")

        }
    }

    @IBAction func buttonLoginTapped(_ sender: UIButton) {
        
    }
    
}

