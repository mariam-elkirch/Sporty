//
//  AlamofireSource.swift
//  Sporty
//
//  Created by user188930 on 5/17/22.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
import Alamofire
class BaseAPI {
    
   /* private let baseURL = "https://www.thesportsdb.com/api/v1/json/2/"

    //MARK: - HttpMethod
    func request<T: Decodable>(, httpMethod: HTTPMethod = .get, parameters: Parameters? ,completion: @escaping (Swift.Result<T, Error>) -> Void) {
        
        let completionOnMain: (Swift.Result<T, Error>) -> Void = { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        
        guard let url = URL(string: "\(baseURL)\(fromEndpoint.rawValue)") else {
            completionOnMain(.failure(Error.self as! Error))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        Alamofire.request(url, method: httpMethod, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: nil).responseJSON { (response) in
            print(response.request)
            if let error = response.error {
                completionOnMain(.failure(error))
                return
            }
          
            guard let urlResponse = response.response else {
                return completionOnMain(.failure(Error.self as! Error))
            }
            if !(200..<300).contains(urlResponse.statusCode) {
                return completionOnMain(.failure(Error.self as! Error))
            }

            guard let data = response.data else { return }
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completionOnMain(.success(response))
            } catch {
                debugPrint("Could not translate the data to the requested type. Reason: \(error.localizedDescription)")
                completionOnMain(.failure(error))
            }
        }
    }*/
}
