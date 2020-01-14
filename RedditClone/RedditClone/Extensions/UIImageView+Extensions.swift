//
//  UIImageView+Extensions.swift
//  RedditClone
//
//  Created by Brian Atiyeh on 1/10/20.
//  Copyright © 2020 Brian Atiyeh. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    // Trivial solution for loading in images and there are a couple issues with it.
    func downloadImageFrom(urlString: String, contentMode: UIView.ContentMode) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data, response, error) -> Void in
                DispatchQueue.main.async {
                    self?.contentMode = contentMode
                    if let data = data {
                        self?.image = UIImage(data: data)
                    }
                }
            }).resume()
        }
    }
}