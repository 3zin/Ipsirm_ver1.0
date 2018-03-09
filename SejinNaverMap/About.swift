//
//  About.swift
//  SejinNaverMap
//
//  Created by 3zin on 2018. 2. 26..
//  Copyright © 2018년 3zin. All rights reserved.
//
//  About section

import UIKit

class About: BaseViewController {

    @IBOutlet weak var monster_1: UIImageView!
    @IBOutlet weak var monster_2: UIImageView!
    @IBOutlet weak var monster_3: UIImageView!
    @IBOutlet weak var monster_4: UIImageView!
    @IBOutlet weak var monster_5: UIImageView!
    @IBOutlet weak var monster_6: UIImageView!
    @IBOutlet weak var monster_7: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.addSlideMenuButton()
        self.title = "About"
        
        // tap이 들어오면 이미지가 흔들리도록 설정
        // GestureRecognizer를 각각의 view마다 따로 만들고 따로 설정해야함... Why?
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(shakeshake))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(shakeshake))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(shakeshake))
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(shakeshake))
        let tap5 = UITapGestureRecognizer(target: self, action: #selector(shakeshake))
        let tap6 = UITapGestureRecognizer(target: self, action: #selector(shakeshake))
        let tap7 = UITapGestureRecognizer(target: self, action: #selector(shakeshake))
        
        let monsters = [monster_1, monster_2, monster_3, monster_4, monster_5, monster_6, monster_7]
        let taps = [tap1, tap2, tap3, tap4, tap5, tap6, tap7]
        
        for (index,monster) in monsters.enumerated(){
            monster?.addGestureRecognizer(taps[index])
            monster?.isUserInteractionEnabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func shakeshake(_ sender:UITapGestureRecognizer){
        sender.view?.shake()
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


// A simple method for shaking the (Image)view
// 자세한 작동방식은 공부 필요

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.8
        animation.values = [-10.0, 10.0, -8.0, 8.0, -5.0, 5.0, -2.0, 2.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}

// more custom method
/*public extension UIView {
 func shake(count : Float = 4,for duration : TimeInterval = 0.5,withTranslation translation : Float = -5) {
 
 let animation : CABasicAnimation = CABasicAnimation(keyPath: "transform.translation.x")
 animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
 animation.repeatCount = count
 animation.duration = duration/TimeInterval(animation.repeatCount)
 animation.autoreverses = true
 animation.byValue = translation
 self.layer.add(animation, forKey: "shake")
 }
 }*/
