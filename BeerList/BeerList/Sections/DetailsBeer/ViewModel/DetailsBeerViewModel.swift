//
//  DetailsBeerViewModel.swift
//  BeerList
//
//  Created by Gabriel on 31/01/24.
//

import Foundation

protocol DetailsBeerViewModelDelegate: AnyObject {
    func didSuccess(data: [DetailsBeerModel]?, id: Int?)
}

class DetailsBeerViewModel {
    
    let id: Int
    weak var delegate: DetailsBeerViewModelDelegate?
    var model: [DetailsBeerModel]?
    var service: BeerService
    
    init(id: Int) {
        self.id = id
        self.service = BeerService()
    }
    
    func getDetailsBeer() {
        service.fetchDetilsBeer(id: id) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                self.model = data
                self.delegate?.didSuccess(data: data, id: id)
            case .failure(let error):
                print("get details beers: \(error)")
            }
        }
    }
}
