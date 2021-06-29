//
//  ViewController.swift
//  BeautyCase01
//  First Screen after starting the app
//
//  Created by Amann, Antonino, Schlocker on 28.06.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var introTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }

    func setUpElements(){
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }
}

