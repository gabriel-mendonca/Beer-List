//
//  DetailsBeerCoordinator.swift
//  BeerList
//
//  Created by Gabriel on 31/01/24.
//

import UIKit

class DetailsBeerCoordinator: Coordinator {
    
    var view: DetailsBeerViewController?
    var navigation: NavigationController?
    var presentationType: PresentationType?
    
    init(id: Int) {
        let viewModel = DetailsBeerViewModel(id: id)
        view = DetailsBeerViewController(viewModel: viewModel)
    }
    
    func stop() {
        
    }
}
