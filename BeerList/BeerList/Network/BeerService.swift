//
//  BeerService.swift
//  BeerList
//
//  Created by Gabriel on 30/01/24.
//

import Foundation

enum ResultBeer {
    case success(data: [ListBeerModel])
    case failure(error: Error)
}

enum ResultDetailsBeer {
    case success(data: [DetailsBeerModel])
    case failure(error: Error)
}

final class BeerService {
    
    func fetchListBeer(completion: @escaping (_ result: ResultBeer) -> Void) {
        
        guard let url = URL(string: BaseURL.url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if error == nil {
                    do {
                        guard let data = data else { return }
                        
                        let list = try JSONDecoder().decode([ListBeerModel].self, from: data)
                        completion(ResultBeer.success(data: list))
                    } catch {
                        if let data = data {
                            let str = String(bytes: data, encoding: .utf8)
                            print("parse error3", str as Any, error)
                        } else {
                            completion(ResultBeer.failure(error: error))
                        }
                    }
                }
            }
        }.resume()
    }
    
    func fetchDetilsBeer(id: Int, completion: @escaping (_ result: ResultDetailsBeer) -> Void) {
        guard let url = URL(string: BaseURL.url + "/\(id)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if error == nil {
                    do {
                        guard let data = data else { return }
                        
                        let detail = try JSONDecoder().decode([DetailsBeerModel].self, from: data)
                        completion(ResultDetailsBeer.success(data: detail))
                    } catch {
                        if let data = data {
                            let str = String(bytes: data, encoding: .utf8)
                            print("parse error3", str as Any, error)
                        } else {
                            completion(ResultDetailsBeer.failure(error: error))
                        }
                    }
                }
            }
        }.resume()
    }
}

enum BaseURL {
    static let url = "https://api.punkapi.com/v2/beers"
}
