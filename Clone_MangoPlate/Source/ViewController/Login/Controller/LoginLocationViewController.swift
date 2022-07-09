//
//  LoginLocationViewController.swift
//  Clone_MangoPlate
//
//  Created by 장석우 on 2022/07/05.
//

import UIKit
import KakaoSDKUser

class LoginLocationViewController : UIViewController{
    
    //MARK: - Properties
    @IBOutlet weak var label: UILabel!
    
    var nickName : String?
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserApi.shared.me { (user, error) in
            if let error = error{
                print(error)
            }
            else{
                self.nickName = user?.kakaoAccount?.profile?.nickname
                print("!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                print(self.nickName!)
                self.label.text = self.nickName
            }
            
        }
        
        
        
    }
    
    //MARK: - Custom Method
    
    //MARK: - IBAction
    
}
