//
//  ListBeerTableViewController.swift
//  BeerList
//
//  Created by Gabriel on 25/01/24.
//

import UIKit

class ListBeerTableViewController: UIViewController {
    
    var viewModel: ListBeerViewModel
    
    static let cellBeerIdentifier = "beerCell"
    
    init(viewModel: ListBeerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getListBeer()
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorColor = .clear
        table.register(ListBeerTableViewCell.self, forCellReuseIdentifier: ListBeerTableViewController.cellBeerIdentifier)
        return table
    }()
    
    private func setupConstraintsTableView() {
        tableView.anchor(top: view.topAnchor,
                         left: view.leftAnchor,
                         bottom: view.bottomAnchor,
                         right: view.rightAnchor)
    }
}

extension ListBeerTableViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ListBeerTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            viewModel.model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListBeerTableViewController.cellBeerIdentifier, for: indexPath) as? ListBeerTableViewCell else { return UITableViewCell() }
        let model = viewModel.model?[indexPath.row]
        cell.setupView()
        cell.populateView(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = viewModel.model?[indexPath.row].id else { return }
        viewModel.sendToDetailsBeer(id: id)
    }
}

extension ListBeerTableViewController: ViewLayoutHelper {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupContraints() {
        setupConstraintsTableView()
    }
    
    func setupAdditionalConfiguration() {
        title = "Beer List"
        viewModel.delegate = self
        tableView.reloadData()
    }
}

extension ListBeerTableViewController: ListBeerViewModelDelegate {
    func didError(error: Error) {
        print("")
    }
    
    func didSuccess(_ viewModel: ListBeerViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.tableView.reloadData()
        }
    }
    
    
}
