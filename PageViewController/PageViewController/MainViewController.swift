//
//  MainViewController.swift
//  PageViewController
//
//  Created by pxh on 2017/2/17.
//  Copyright © 2017年 pxh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var pageViewController : UIPageViewController!
    var oneViewController : OneViewController!
    var twoViewController : TwoViewController!
    var threeViewController : ThreeViewController!
    var controllers = [UIViewController]()
    
    @IBOutlet var navView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = self.navView
        
        //获取到嵌入的UIPageViewController
        pageViewController = self.childViewControllers.first as! UIPageViewController
        
        //根据Storyboard ID来创建一个View Controller
        oneViewController = storyboard?.instantiateViewController(withIdentifier: "OneViewController") as! OneViewController
        twoViewController = storyboard?.instantiateViewController(withIdentifier: "TwoViewController") as! TwoViewController
        threeViewController = storyboard?.instantiateViewController(withIdentifier: "ThreeViewController") as! ThreeViewController
        
        //设置pageViewController的数据源代理为当前Controller
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        //设置pageViewController提供一个页面
        pageViewController.setViewControllers([twoViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        //把页面添加到数组中
        controllers.append(oneViewController)
        controllers.append(twoViewController)
        controllers.append(threeViewController)
    }

    @IBAction func naviBtnAction(_ sender: UIButton) {
        switch sender.tag {
        case 2000:
            pageViewController.setViewControllers([oneViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        case 2001:
            pageViewController.setViewControllers([twoViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        case 2002:
            pageViewController.setViewControllers([threeViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        default:
            break
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension MainViewController : UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    //返回当前页面的下一个页面
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: OneViewController.self) {
            return twoViewController
        }else if viewController.isKind(of: TwoViewController.self){
            return threeViewController
        }
        return nil
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: ThreeViewController.self) {
            return twoViewController
        }else if viewController.isKind(of: TwoViewController.self){
            return oneViewController
        }
        return nil
    }
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
}
