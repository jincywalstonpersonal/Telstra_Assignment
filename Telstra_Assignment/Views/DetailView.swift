//
//  DetailView.swift
//  Telstra_Assignment
//
//  Created by mac_admin on 1/23/19.
//  Copyright © 2019 mac_admin. All rights reserved.
//

import Foundation
import UIKit

class DetailView: UIView {
    var label: UILabel?
    var imageView: UIImageView?
    
    var caption: String? {
        get { return label?.text }
        set { label?.text = newValue }
    }
    
    var image: UIImage? {
        get { return imageView?.image }
        set { imageView?.image = newValue }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {

        // sets the image's frame to fill our view
      
        imageView = UIImageView(frame: bounds)
        imageView?.contentMode = UIViewContentMode.scaleAspectFill
        imageView?.clipsToBounds = true
        addSubview(imageView!)
        
        // caption has translucent grey background 30 points high and span across bottom of view
        let captionBackgroundView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: bounds.height - 30), size: CGSize(width: bounds.width, height: 30)))
        
        captionBackgroundView.backgroundColor = UIColor(white: 0.1, alpha: 0.8)
        addSubview(captionBackgroundView)
        
        label = UILabel(frame: captionBackgroundView.bounds.insetBy(dx: 10, dy: 5))
        
        label?.textColor = UIColor(white: 0.9, alpha: 1.0)
        captionBackgroundView.addSubview(label!)
    }
}
