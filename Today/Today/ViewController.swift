//
//  ViewController.swift
//  Today
//
//  Created by vanchan on 3/6/18.
//  Copyright © 2018 Scrap Tech. All rights reserved.
//

import UIKit
import Kingfisher
import Hero

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://avatarfiles.alphacoders.com/717/71761.jpg")!
        self.button.kf.setImage(with: url, for: .normal, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
//        self.imageView.kf.setImage(with: url);
        
    }
}

