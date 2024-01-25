//
//  ListBeerCoordinator.swift
//  BeerList
//
//  Created by Elaine Maria on 25/01/24.
//

import UIKit

class ListBeerCoordinator: Coordinator {
    var view: ListBeerTableViewController?
    var navigation: UINavigationController?
    var presentationType: PresentationType?
    
    func start() -> ListBeerTableViewController {
        let viewModel = ListBeerViewModel()
        view = ListBeerTableViewController()
        return view!
    }
    
    func stop() {
        
    }
    
    
}
