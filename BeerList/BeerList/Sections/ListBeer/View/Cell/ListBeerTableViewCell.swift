//
//  ListBeerTableViewCell.swift
//  BeerList
//
//  Created by Gabriel on 25/01/24.
//

import UIKit

class ListBeerTableViewCell: UITableViewCell {
    
    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var stackViewVertical: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleBeer, subTitleBeer])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 5
        return stack
    }()
    
    lazy var stackViewHorizontal: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageIcon, stackViewVertical, arrowImageRight])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.spacing = 16
        return stack
    }()
    
    lazy var imageIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var arrowImageRight: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "arrow")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var titleBeer: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(hexString: "#666666")
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.font = UIFont.systemFont(ofSize: 18)
        return title
    }()
    
    lazy var subTitleBeer: UILabel = {
        let subTitle = UILabel()
        subTitle.textColor = UIColor(hexString: "#B1B1B1")
        subTitle.numberOfLines = 0
        subTitle.lineBreakMode = .byWordWrapping
        subTitle.font = UIFont.systemFont(ofSize: 14)
        return subTitle
    }()
    
    func populateView(model: ListBeerModel?) {
        guard let model = model else { return }
        self.imageIcon.renderImageView(urlImage: model.imageUrl ?? "")
        self.titleBeer.text = model.name ?? ""
        self.subTitleBeer.text = model.tagline ?? ""
    }
    
    private func viewConfiguration() {
        stackViewHorizontal.clipsToBounds = true
        stackViewHorizontal.layer.cornerRadius = 8
        stackViewHorizontal.backgroundColor = UIColor(hexString: "#F6F6F6")
        self.selectionStyle = .none
    }
    
    private func setupConstrainstsStackViewHorizontal() {
        stackViewHorizontal.anchor(top: contentView.topAnchor,
                                   left: contentView.leftAnchor,
                                   bottom: contentView.bottomAnchor,
                                   right: contentView.rightAnchor,
                                   topConstant: 8,
                                   leftConstant: 16,
                                   bottomConstant: 8,
                                   rightConstant: 16,
                                   heightConstant: 80)
    }
    
    private func setupConstraintsStackViewVertical() {
        stackViewVertical.anchor(top: stackViewHorizontal.topAnchor,
                                 bottom: stackViewHorizontal.bottomAnchor,
                                 topConstant: 20,
                                 bottomConstant: 20)
    }
    
    private func setupConstraintsTitleBeer() {
        titleBeer.anchor(heightConstant: 20)
    }
    
    private func setupConstraintsSubTitleBeer() {
        subTitleBeer.anchor(heightConstant: 20)
    }
    
    private func setupConstraintsImageIcon() {
        imageIcon.anchor(top: stackViewHorizontal.topAnchor,
                         left: stackViewHorizontal.leftAnchor,
                         bottom: contentView.bottomAnchor,
                         topConstant: 10,
                         leftConstant: 10,
                         bottomConstant: 20,
                         widthConstant: 46)
        
    }
    
    private func setupConstraintsArrowImageRight() {
        arrowImageRight.anchor(right: contentView.rightAnchor,
                               rightConstant: 34,
                               widthConstant: 16,
                               heightConstant: 16)
    }
}

extension ListBeerTableViewCell: ViewLayoutHelper {
    func buildViewHierarchy() {
        contentView.addSubview(stackViewHorizontal)
    }
    
    func setupContraints() {
        setupConstrainstsStackViewHorizontal()
        setupConstraintsStackViewVertical()
        setupConstraintsTitleBeer()
        setupConstraintsSubTitleBeer()
        setupConstraintsImageIcon()
        setupConstraintsArrowImageRight()
    }
    
    func setupAdditionalConfiguration() {
        viewConfiguration()
    }
}
