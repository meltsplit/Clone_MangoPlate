//
//  SearchMainViewController.swift
//  Clone_MangoPlate
//
//  Created by 장석우 on 2022/07/09.
//

import UIKit
import Alamofire

class SearchMainViewController : UIViewController{
    
    //MARK: - Properties
    
    @IBOutlet weak var searchTextField: UITextField!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        searchTextField.delegate = self
    }
    
    //MARK: - Custom Method
    
    //MARK: - IBOutlet
    
}

extension SearchMainViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return")
        NotificationCenter.default.post(name: NSNotification.Name.searchTitle, object: searchTextField.text!)
        searchTextField.endEditing(true)
        return true
    }
}

