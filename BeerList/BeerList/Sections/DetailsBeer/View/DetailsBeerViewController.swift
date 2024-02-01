//
//  DetailsBeerViewController.swift
//  BeerList
//
//  Created by Gabriel on 31/01/24.
//

import UIKit

class DetailsBeerViewController: UIViewController {
    
    var viewModel: DetailsBeerViewModel
    
    init(viewModel: DetailsBeerViewModel) {
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
        viewModel.getDetailsBeer()
    }
    
    lazy var beerImageDetail: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var titleNameDetail: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(hexString: "#666666")
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.font = UIFont.systemFont(ofSize: 24)
        return title
    }()
    
    lazy var subTitleDetail: UILabel = {
        let tag = UILabel()
        tag.textColor = UIColor(hexString: "#666666")
        tag.font = UIFont.systemFont(ofSize: 12)
        return tag
    }()
    
    lazy var descriptionBeerText: UILabel = {
        let text = UILabel()
        text.textColor = UIColor(hexString: "#B1B1B1")
        text.font = UIFont.systemFont(ofSize: 14)
        text.textAlignment = .left
        text.numberOfLines = 0
        text.lineBreakMode = .byWordWrapping
        return text
    }()
    
    private func populateData(data: [DetailsBeerModel]?, id: Int?) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            guard let data = data?[0] else { return }
            self.beerImageDetail.renderImageView(urlImage: data.imageUrl ?? "")
            self.titleNameDetail.text = data.name ?? ""
            self.subTitleDetail.text = data.tagline ?? ""
            self.descriptionBeerText.text = data.descriptions ?? ""
        }
    }
    
    private func setupConstraintsBeerImage() {
        beerImageDetail.anchor(top: view.topAnchor,
                         left: view.leftAnchor,
                         topConstant: 127,
                         leftConstant: 16,
                         widthConstant: 100,
                         heightConstant: 100)
    }
    
    private func setupConstraintsTitleNameDetail() {
        titleNameDetail.anchor(top: view.topAnchor,
                               left: beerImageDetail.rightAnchor,
                               right: view.rightAnchor,
                               topConstant: 138,
                               leftConstant: 16,
                               rightConstant: 16)
    }
    
    private func setupConstraintsSubTitleDetail() {
        subTitleDetail.anchor(top: titleNameDetail.bottomAnchor,
                              left: beerImageDetail.rightAnchor,
                              right: view.rightAnchor,
                              topConstant: 8,
                              leftConstant: 16,
                              rightConstant: 16)
    }
    
    private func setupConstraintsDescriptionBeerText() {
        descriptionBeerText.anchor(top: beerImageDetail.bottomAnchor,
                               left: view.leftAnchor,
                               right: view.rightAnchor,
                               topConstant: 33,
                               leftConstant: 16,
                               rightConstant: 16)
    }
}

extension DetailsBeerViewController: ViewLayoutHelper {
    func buildViewHierarchy() {
        view.addSubview(beerImageDetail)
        view.addSubview(titleNameDetail)
        view.addSubview(subTitleDetail)
        view.addSubview(descriptionBeerText)
    }
    
    func setupContraints() {
        setupConstraintsBeerImage()
        setupConstraintsSubTitleDetail()
        setupConstraintsDescriptionBeerText()
        setupConstraintsTitleNameDetail()
    }
    
    func setupAdditionalConfiguration() {
        title = "Beer Details"
        view.backgroundColor = .white
        viewModel.delegate = self
    }
    
}

extension DetailsBeerViewController: DetailsBeerViewModelDelegate {
    func didSuccess(data: [DetailsBeerModel]?, id: Int?) {
        populateData(data: data, id: id)
    }
    
    
}
