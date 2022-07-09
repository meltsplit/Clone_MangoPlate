//
//  MyLogger.swift
//  Clone_MangoPlate
//
//  Created by 장석우 on 2022/07/07.
//

import Foundation
import Alamofire

final class MyLogger : EventMonitor{
    let queue = DispatchQueue(label: "APILog")
    
//    func requestDidResume(_ request: Request) {
//        print("MyLogger - requestDidResume()")
//        debugPrint(request)
//    }
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        print("MyLogger - request didParseResponse()")
        
        guard let statusCode = request.response?.statusCode else { return }
        
        //debugPrint(request)
        print("[\(request)]")
        print("[Status Code : \(statusCode)]")
        print("[Data] : \(response.data)")
    }
    
}
