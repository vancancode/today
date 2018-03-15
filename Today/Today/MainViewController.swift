//
//  MainViewController.swift
//  Today
//
//  Created by vanchan on 3/7/18.
//  Copyright © 2018 Scrap Tech. All rights reserved.
//

import UIKit
import Kingfisher
import Hero

func + (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

class MainViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIImageView!
     var panGR = UIPanGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set Controller Background Image
        let url = URL(string: "https://avatarfiles.alphacoders.com/717/71761.jpg")!
        backgroundView.kf.setImage(with: url)
        
        panGR.addTarget(self, action: #selector(pan))
        view.addGestureRecognizer(panGR)
    }
    
    @objc func pan() {
        // calculate the progress based on how far the user moved
        let translation = panGR.translation(in: nil)
        let progress = translation.y / 2 / view.bounds.height
        
        switch panGR.state {
        case .began:
            // begin the transition as normal
            hero.dismissViewController()
        case .changed:
            Hero.shared.update(progress)
            Hero.shared.apply(modifiers: [.position(CGPoint(x:backgroundView.center.x, y:translation.y + backgroundView.center.y))], to: backgroundView)
        default:
            // end or cancel the transition based on the progress and user's touch velocity
            if progress + panGR.velocity(in: nil).y / view.bounds.height > 0.3 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
