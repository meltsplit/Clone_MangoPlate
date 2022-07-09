//
//  SearchService.swift
//  Clone_MangoPlate
//
//  Created by 장석우 on 2022/07/09.
//

import Foundation
import Alamofire
import SwiftUI

struct SearchBookService {
    
    static let shared = SearchBookService()
    private init() {}
}
extension SearchBookService{
    
    func searchBook(title : String, completion : @escaping (NetworkResult<Any>) -> (Void) ){
     
        let url = APIConstants.bookURL
        print(url)
        
        let header : HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": Secret.kakaoRestAPIKey
        ]
        
        let body : Parameters = [
            "query": title
        ]

        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: body,
                                     encoding: URLEncoding.default,
                                     headers: header
                                    )
        
        dataRequest.responseData{ response in
            debugPrint(response)
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else{
                    return
                }
                guard let data = response.value else{
                    return
                }
               
                completion(judge(status: statusCode, data: data))

            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
            
        }
        
        
        
    }
    
    private func judge(status : Int, data : Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        print("SearchBookService - judge()")
        
        guard let decodedData = try? decoder.decode(SearchBookModel.self, from : data) else{
            print("decode실패"); return .pathErr
        }
        print("decodeData : \(decodedData)")
        switch status{
        case 200..<300:
            return .success(decodedData)
        case 400..<500 :
            return .requestErr(decodedData)
        case 500 :
            return .serverErr
            
        default :
            return .networkFail
            
            
        }
        
        
    }
    
    
    
}
