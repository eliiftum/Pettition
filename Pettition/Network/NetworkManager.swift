//
//  NetworkManager.swift
//  Pettition
//
//  Created by Elif Tum on 18.05.2023.
//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    func getData<T:Codable> (url:String?, completion:@escaping(Result<T,Error>)->()){
        guard let url = URL(string:url ?? "") else {return}
        let session = URLSession.shared
        session.dataTask(with: URLRequest(url:url)) {data, response, error in
            
            if let data = data {
                do{
                    let decoded = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decoded))
                }
                catch{
                    print(String(describing: error))
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            
            if let error = error {
                completion(.failure(error))
            }
            
        }
        
        .resume()
    }
}
