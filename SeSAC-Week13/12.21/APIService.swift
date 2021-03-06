//
//  APIService.swift
//  SeSAC-Week13
//
//  Created by AlexHwang on 2021/12/21.
//

import Foundation

enum APIError: String, Error {
    case unknownError = "alert_error_unknown"
    case serverError = "alert_error_server"
}

extension APIError: LocalizedError {
    
    var errorDescription: String? { // 에러 추가 switch case 필요없이 rawVlue에 등록해두고 표출하는식
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

class APIService {
    
    let sourceURL = URL(string: "http://kobis.or.kr/kobisopenapi/webservice/rest/people/searchPeopleList.json?key=f5eef3421c602c6cb7ea224104795888")!
    
    func requestCast(completion: @escaping (Cast?) -> Void) {
        URLSession.shared.dataTask(with: sourceURL) { data, response, error in
            if error != nil {
                self.showAlert(.unknownError)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                self.showAlert(.serverError)
                return
            }
            
            if let data = data, let castData = try? JSONDecoder().decode(Cast.self, from: data) {
                print("SUCCESS")
                completion(castData)
                return
            }
            
            completion(nil)
            
        }.resume()
    }
    
    func showAlert(_ msg: APIError) {
        
    }
    
}
