//
//  AddUserController.swift
//  StudyApp
//
//  Created by Andrii Damm on 2017-10-30.
//  Copyright © 2017 Stonned Dwarfs. All rights reserved.
//

import UIKit

class AddUserController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //labels
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    //inputs outlets
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var facebookId: UITextField!
    
    //buttons outlests
    
    @IBOutlet weak var addButton: CustomButton!
    
    //buttons actions
    
    @IBAction func addUserThroughFacebook(_ sender: CustomButton) {
        facebookId.isHidden = false
        addButton.isHidden = false
    }
    
    @IBAction func submit(_ sender: CustomButton) {
        
        let path = Bundle.main.path(forResource: "DB", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        
        let fn = fullName.text
        let em = email.text
        let ph = phone.text
        
        let dict = NSMutableDictionary()
        
        dict.setValue(fn,forKey: fullNameLabel.text!)
        dict.setValue(em, forKey: emailLabel.text!)
        dict.setValue(ph, forKey: phoneLabel.text!)
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            try jsonData.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func clear(_ sender: CustomButton) {
    }
}
