//
//  Alamofire Manager.swift
//  Clone_MangoPlate
//
//  Created by 장석우 on 2022/07/07.
//

import Foundation
import Alamofire

final class AlamofireManager{
    
    //싱글톤 패턴
    static let shared = AlamofireManager()
    
    //인터셉터 설정
    let interceptors = Interceptor(interceptors:
                        [
                            BaseIntercepter()
                        ])
    //로거 설정
    let monitors = [MyLogger()]
    //세션 설정
    
    var session : Session
    
    private init(){
        session = Session(interceptor : interceptors, eventMonitors: monitors)
    }
}
