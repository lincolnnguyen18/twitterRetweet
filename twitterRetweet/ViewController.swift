//
//  ViewController.swift
//  twitterRetweet
//
//  Created by Lincoln Nguyen on 2/14/21.
//

import UIKit
import SwiftyGif

class ViewController: UIViewController {
    @IBOutlet weak var retweet: UIImageView! {
        didSet {
            retweet.isUserInteractionEnabled = false
            retweet.image = UIImage(named: "retweet2")
        }
    }
    @IBOutlet weak var retweetGreen: UIImageView! {
        didSet {
            retweet.isUserInteractionEnabled = false
        }
    }
    @IBOutlet weak var tapArea: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
        
        // Add Tap Gesture Recognizer
        tapArea.addGestureRecognizer(tapGestureRecognizer)
    }

    @IBOutlet weak var normalWidth: NSLayoutConstraint!
    @IBOutlet weak var greenWidth: NSLayoutConstraint!
    var isRetweeted = false
    
    @objc private func didTapImageView(_ sender: UITapGestureRecognizer) {
        print("did tap image view", sender)
        
        if !isRetweeted {
            // let gif = try UIImage(gifName: "favoriteAnimate.gif")
            // self.retweet.setGifImage(gif, loopCount: 1)
            self.retweetGreen.setImage(UIImage(named: "retweeted2")!)
            self.retweet.isHidden = true
            self.retweetGreen.isHidden = false
            // self.heart.removeConstraint(heartWidth)
            // self.heart.addConstraint(NSLayoutConstraint(item: self.heart!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 50))
            // heartWidth.constant = 53
            
            
            print("TO green!!")
            
            UIView.animate(withDuration: 0.03, animations: {
                // self.heartWidth.constant = 100
                // self.view.layoutIfNeeded()
                // self.heart.transform = CGAffineTransform(scaleX: 3, y: 3)
                self.greenWidth.constant = 30
                self.view.layoutIfNeeded()
            }) { (finished) in
                UIView.animate(withDuration: 0.1, delay: 0.1, animations: {
                    // self.heart.transform = CGAffineTransform.identity
                    self.greenWidth.constant = 19
                    self.view.layoutIfNeeded()
                })
            }
            
            
            isRetweeted = true
        } else {
            self.retweet.setImage(UIImage(named: "retweet2")!)
            self.retweet.isHidden = false
            self.retweetGreen.isHidden = true
        
            print("To not green!")
        
            UIView.animate(withDuration: 0.03, animations: {
                // self.heartWidth.constant = 100
                // self.view.layoutIfNeeded()
                // self.heart.transform = CGAffineTransform(scaleX: 3, y: 3)
                self.normalWidth.constant = 30
                self.view.layoutIfNeeded()
            }) { (finished) in
                UIView.animate(withDuration: 0.1, delay: 0.15, animations: {
                    // self.heart.transform = CGAffineTransform.identity
                    self.normalWidth.constant = 19
                    self.view.layoutIfNeeded()
                })
            }
        
            // UIView.animate(withDuration: 5) {
            //     self.heartWidth.constant = 40
            //     self.view.layoutIfNeeded()
            // }
        
            // UIView.animate(withDuration: 2) {
            //     self.heartWidth.constant = 20
            //     self.view.layoutIfNeeded()
            // }
        
        
            // UIView.animate(withDuration: 0.2) {
            //     self.heartWidth.constant = 20
            //     self.view.layoutIfNeeded()
            // }
            isRetweeted = false
        }
    }
}

