//
//  ViewController.swift
//  NeteaseCloudMusic
//
//  Created by Nirvana on 3/19/16.
//  Copyright © 2016 NSNirvana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let surroundings = UIBarButtonItem()
    private let music = UIBarButtonItem()
    private var pageView: CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addLeftAndRightBarButtonItem()
        hideNavBarHairLineImageView()
        addPageMenu()
    }

    /**
     添加主PageView
     */
    func addPageMenu() {
        let array: [(String,String)] = [
            ("PersonalizeVC","个性推荐"),
            ("ListVC","歌单"),
            ("BroadcastVC","主播电台"),
            ("TopVC","排行榜")
        ]
        
        let controllerArray = instantiateViewControllerWithIdentifiersAndTitles(array)
        let parameters = offerCAPSPageMenuOptionsAccordingToNumber(array.count)
        
        pageView = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 64.0, self.view.frame.width, self.view.frame.height-64), pageMenuOptions: parameters)
        self.view.addSubview(pageView!.view)
    }
    
    /**
     提供pageView配置参数
     
     - returns: 配置参数集
     */
    func offerCAPSPageMenuOptionsAccordingToNumber(number: Int) -> [CAPSPageMenuOption] {
        let menuItemWidth: CGFloat = 75.0
        
        let screenWidth = UIScreen.mainScreen().bounds.width
        let menuMargin = (screenWidth - CGFloat(number)*menuItemWidth)/CGFloat(number+1)
        
        let parameters: [CAPSPageMenuOption] = [
            .MenuItemSeparatorWidth(0),
            .ScrollMenuBackgroundColor(UIColor(red: 248.0/255.0, green: 248.0/255.0, blue: 248.0/255.0, alpha: 1.0)),
            .ViewBackgroundColor(UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)),
            .BottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
            .SelectionIndicatorColor(UIColor(red: 206.0/255.0, green: 42.0/255.0, blue: 33.0/255.0, alpha: 1.0)),
            .MenuMargin(menuMargin),
            .MenuHeight(39.0),
            .MenuItemWidth(menuItemWidth),
            .SelectedMenuItemLabelColor(UIColor(red: 206.0/255.0, green: 42.0/255.0, blue: 33.0/255.0, alpha: 1.0)),
            .UnselectedMenuItemLabelColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
            .MenuItemFont(UIFont(name: "HelveticaNeue", size: 15.0)!),
            .UseMenuLikeSegmentedControl(false),
            .MenuItemSeparatorRoundEdges(true),
            .SelectionIndicatorHeight(2.0),
            .MenuItemSeparatorPercentageHeight(0.1)
        ]
        return parameters
    }
    
    /**
     传入标识符以及名称实例化VC
     
     - parameter dictionary: [(identifier,title)]
     
     - returns: 实例化后的VCs
     */
    func instantiateViewControllerWithIdentifiersAndTitles(array: [(String,String)]) -> [UIViewController] {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var controllerArray: [UIViewController] = []
        
        for i in 0 ..< array.count {
            let vc = storyBoard.instantiateViewControllerWithIdentifier(array[i].0)
            vc.title = array[i].1
            controllerArray.append(vc)
        }
        return controllerArray
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

