//
//  ViewController.swift
//  BullsEye
//
//  Created by Bob on 2017/11/3.
//  Copyright © 2017年 Bob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    @IBOutlet weak var slider: UISlider!

    // 此方法会在view启动的时候执行，可以在此进行一些初始化的工作
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() { // Bob：@IBAction 是什么东西？
        let message = "The value of the slider is: \(currentValue)"
        let alert = UIAlertController(title: "Hello, World", // Bob：xcode会有这些参数提示么？
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "ok",
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) { // Bob：变量名 slider前面的 下划线 是什么东西？和UI关联的方法对参数个数是什么限定条件？
        print("The value of the slider is now: \(slider.value)")  // Bob：反斜线是干嘛用的？括号是否必须？—— \(...) 作为占位符使用，类似于 $(...)求值
        currentValue = lroundf(slider.value)
    }
}

