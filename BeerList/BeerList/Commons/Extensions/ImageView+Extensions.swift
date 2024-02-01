//
//  ImageView+Extensions.swift
//  BeerList
//
//  Created by Gabriel on 31/01/24.
//

import UIKit

extension UIImageView {
    
    func renderImageView(urlImage: String) {
        ImageCache.shared.loadImage(with: urlImage) { [weak self] image in
            guard let self else { return }
            guard let image = image else { return }
            self.image = image
        }
    }
}
