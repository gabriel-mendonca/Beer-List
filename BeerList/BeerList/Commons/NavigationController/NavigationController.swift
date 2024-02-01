//
//  NavigationController.swift
//  BeerList
//
//  Created by Gabriel on 26/01/24.
//

import UIKit

class NavigationController: UINavigationController {
    
    public typealias Action = Selector?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavigationBar()
        self.delegate = self
    }
    
    private func configNavigationBar() {
        let navBarColor = UIColor(hexString: "#4A90E2")
        let titleFont = UIFont.systemFont(ofSize: 20)
        let titleColor = UIColor(hexString: "#FFFFFF")
        
        let standard = UINavigationBarAppearance()
        standard.configureWithOpaqueBackground()
        standard.backgroundColor = navBarColor
        standard.titleTextAttributes = [.font: titleFont,
                                        .foregroundColor: titleColor]
        UINavigationBar.appearance().standardAppearance = standard
        UINavigationBar.appearance().scrollEdgeAppearance = standard
    }
    
    public func addleftButton(imageWidth: Float,
                              imageHeight: Float,
                              image: UIImage,
                              action: Action = nil) -> UIBarButtonItem {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.widthAnchor.constraint(equalToConstant: CGFloat(imageWidth)).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: CGFloat(imageHeight)).isActive = true
        
        let leftButton = UIBarButtonItem(image: imageView.image,
                                         style: .plain,
                                         target: self,
                                         action: action)
        leftButton.tintColor = .white
        return leftButton
    }
    
    @objc func backButtonTapped() {
        self.popViewController(animated: true)
    }
}

extension NavigationController: UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        let button: UIBarButtonItem!
        
        if navigationController.viewControllers.count > 1 {
            button = addleftButton(imageWidth: 16, imageHeight: 16, image: UIImage(named: "return") ?? UIImage(), action: #selector(backButtonTapped))
        } else {
            button = UIBarButtonItem()
        }
        
        viewController.navigationItem.leftBarButtonItem = button
    }
}
