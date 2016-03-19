//
//  ViewController.swift
//  NeteaseCloudMusic
//
//  Created by Nirvana on 3/19/16.
//  Copyright © 2016 NSNirvana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var surroundings = UIBarButtonItem()
    var music = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        surroundings.image = UIImage(named: "iconfont-tinggeshiqu")?.imageWithRenderingMode(.AlwaysOriginal)
        music.image = UIImage(named: "iconfont-yinle")?.imageWithRenderingMode(.AlwaysOriginal)
        
        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        negativeSpacer.width = -8
        
        self.navigationItem.leftBarButtonItems = [negativeSpacer, surroundings]
        self.navigationItem.rightBarButtonItems = [negativeSpacer, music]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

