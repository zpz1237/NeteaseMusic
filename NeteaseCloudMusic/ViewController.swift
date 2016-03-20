//
//  ViewController.swift
//  NeteaseCloudMusic
//
//  Created by Nirvana on 3/19/16.
//  Copyright © 2016 NSNirvana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var surroundings = UIBarButtonItem()
    private var music = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLeftAndRightBarButtonItem()
        hideNavBarHairLineImageView()
    }

    /**
     隐藏shadowImage并保持NavBar的半透明性
     */
    func hideNavBarHairLineImageView() {
        let navBarHairLineImageView = findNavBarHairLineImageView(self.navigationController!.navigationBar)
        navBarHairLineImageView!.hidden = true
    }
    
    /**
     递归查找shadowImage
     
     - parameter view: 包含shadowImage的父View
     
     - returns: shadowImage
     */
    func findNavBarHairLineImageView(view: UIView) -> UIImageView? {
        if view is UIImageView && view.bounds.size.height <= 1 {
            return view as! UIImageView
        }
        for subview in view.subviews {
            if let imageView = findNavBarHairLineImageView(subview) {
                return imageView
            }
        }
        return nil
    }
    
    /**
     添加左右按钮
     */
    func addLeftAndRightBarButtonItem() {
        surroundings.image = UIImage(named: "iconfont-tinggeshiqu")?.imageWithRenderingMode(.AlwaysOriginal)
        music.image = UIImage(named: "iconfont-yinle")?.imageWithRenderingMode(.AlwaysOriginal)
        
        surroundings.target = self
        music.target = self

        surroundings.action = "clickedLeftBarButtonItem"
        music.action = "clickedRightBarButtonItem"
        
        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        negativeSpacer.width = -8
        
        self.navigationItem.leftBarButtonItems = [negativeSpacer, surroundings]
        self.navigationItem.rightBarButtonItems = [negativeSpacer, music]
    }
    
    /**
     听歌识曲
     */
    func clickedLeftBarButtonItem() {
        print("left")
    }
    
    /**
     正在播放
     */
    func clickedRightBarButtonItem() {
        print("right")
    }
}

