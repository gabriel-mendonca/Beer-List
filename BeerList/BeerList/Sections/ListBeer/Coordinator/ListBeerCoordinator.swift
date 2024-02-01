//
//  ListBeerCoordinator.swift
//  BeerList
//
//  Created by Gabriel on 25/01/24.
//

import UIKit

class ListBeerCoordinator: Coordinator {
    var view: ListBeerTableViewController?
    var navigation: NavigationController?
    var presentationType: PresentationType?
    
    var detailsBeerCoordinator: DetailsBeerCoordinator!
    
    init() {
        let viewModel = ListBeerViewModel()
        viewModel.coordinatorDelegate = self
        view = ListBeerTableViewController(viewModel: viewModel)
    }
    
    func stop() {
        view = nil
        presentationType = nil
        navigation = nil
    }
}

extension ListBeerCoordinator: ListBeerViewModelCoordinatorDelegate {
    func goToDetailsBeer(id: Int, _ viewModel: ListBeerViewModel) {
        guard let navigation = navigation else { return }
        detailsBeerCoordinator = DetailsBeerCoordinator(id: id)
        detailsBeerCoordinator.start(usingPresentation: .push(navigationController: navigation), animated: true)
    }
}
