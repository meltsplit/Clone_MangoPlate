//
//  LoginMainViewController.swift
//  Clone_MangoPlate
//
//  Created by 장석우 on 2022/07/05.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginMainViewController : UIViewController{
    
    let agreeLocationVC = UIStoryboard.init(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginLocationViewController") as! LoginLocationViewController
    
    //MARK: - Properties
    
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Custom Method
    
    private func loginWithAPI(){
        print("")
    }
    
    //MARK: - IBAction
    
    @IBAction func kakaoBtnPressed(_ sender: UIButton) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    self.navigationController?.pushViewController(self.agreeLocationVC, animated: false)
                }
            }
    }
    
    
    
}
