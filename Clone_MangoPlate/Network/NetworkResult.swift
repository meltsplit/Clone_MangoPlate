//
//  NetworkResult.swift
//  Clone_MangoPlate
//
//  Created by 장석우 on 2022/07/09.
//

import Foundation

enum NetworkResult<T> {
    
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
    
}
