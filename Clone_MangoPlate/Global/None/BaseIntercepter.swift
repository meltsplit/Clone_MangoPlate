//
//  BaseIntercepter.swift
//  Clone_MangoPlate
//
//  Created by 장석우 on 2022/07/07.
//

import Foundation
import Alamofire

class BaseIntercepter : RequestInterceptor{
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        print("Base Intercepter = adapt() called")
        
        var request = urlRequest
        
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Accept")
        
        //공통 파라미터 추가
        var dictionary = [String:String]()
        dictionary.updateValue(Secret.usplashToken, forKey: "client_id")
        
        do{
            request = try URLEncodedFormParameterEncoder().encode(dictionary, into: request)
        } catch{
            print(error)
        }
        
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        print("Base Intercepter = adapt() called")
        
        completion(.doNotRetry)
    }
}
