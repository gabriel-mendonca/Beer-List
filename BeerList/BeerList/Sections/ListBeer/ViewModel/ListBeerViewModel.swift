//
//  ListBeerViewModel.swift
//  BeerList
//
//  Created by Gabriel on 25/01/24.
//

import Foundation

protocol ListBeerViewModelDelegate: AnyObject {
    func didError(error: Error)
    func didSuccess(_ viewModel: ListBeerViewModel)
}

protocol ListBeerViewModelCoordinatorDelegate: AnyObject {
    func goToDetailsBeer(id: Int, _ viewModel: ListBeerViewModel)
}

class ListBeerViewModel {
    
    weak var delegate: ListBeerViewModelDelegate?
    weak var coordinatorDelegate: ListBeerViewModelCoordinatorDelegate?
    var model: [ListBeerModel]?
    let service: BeerService
    
    init(delegate: ListBeerViewModelDelegate? = nil) {
        self.delegate = delegate
        self.service = BeerService()
    }
    
    func getListBeer() {
        service.fetchListBeer() { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                self.model = data
                self.delegate?.didSuccess(self)
            case .failure(let error):
                print("get beers: \(error)")
                self.delegate?.didError(error: error)
            }
        }
    }
    
    func sendToDetailsBeer(id: Int) {
        coordinatorDelegate?.goToDetailsBeer(id: id, self)
    }
}
