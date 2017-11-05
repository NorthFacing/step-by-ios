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
    var targetValue: Int = 0
    var round = 0
    var score = 0

    /*
     Bob：@IBOutlet是什么东西？
     和@IBAction差不多，只不过这个是建立引用，后者是触发action方法
     */
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    // 此方法会在view启动的时候执行，可以在此进行一些初始化的工作
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewGame()
        updateLabels()
        
        // slider 美化开始
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        // slider 美化开始-结束

    }

    @IBAction func sliderMoved(_ slider: UISlider) { // Bob：变量名 slider前面的 下划线 是什么东西？和UI关联的方法对参数个数是什么限定条件？
        print("The value of the slider is now: \(slider.value)")  // Bob：反斜线是干嘛用的？括号是否必须？—— \(...) 作为占位符使用，类似于 $(...)求值
        currentValue = lroundf(slider.value)
    }
    
    /*
     Bob：@IBAction 是什么东西？
     带有@IBAction标志的方法称为“action method”，和一般的方法唯一的区别在于可以让 Interface Builder看到并与UI组件进行关联
     */
    @IBAction func showAlert() {
        print(targetValue)
        print(currentValue)
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points) points"

        let alert = UIAlertController(title: title, // Bob：xcode会有这些参数提示么？
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "ok",
                                   style: .default,
                                   handler: {
                                    action in
        self.startNewRound()
                                    self.updateLabels()
        }
        )
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

