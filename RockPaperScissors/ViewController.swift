//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Rameses Resuena on 2017-06-11.
//  Copyright © 2017 Rameses Resuena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
    }
    
    var playerName = String()
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameVC = segue.destination as! GameViewController
        if (nameTextField.text?.isEmpty)! {
            gameVC.playerName = "PLAYER"
        } else {
            gameVC.playerName = nameTextField.text!
        }
    }

}

