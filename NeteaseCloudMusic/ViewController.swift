//
//  ViewController.swift
//  NeteaseCloudMusic
//
//  Created by Nirvana on 3/19/16.
//  Copyright © 2016 NSNirvana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var surroundings: UIBarButtonItem!
    @IBOutlet weak var music: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        surroundings.image = UIImage(named: "iconfont-tinggeshiqu")?.imageWithRenderingMode(.AlwaysOriginal)
        music.image = UIImage(named: "iconfont-yinle")?.imageWithRenderingMode(.AlwaysOriginal)
        
        self.navigationItem.titleView?.frame.origin.x = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

