//
//  ViewController.swift
//  animations
//
//  Created by RaveBizz on 2/2/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var greenSquare: UIView!
    
    lazy var redSquare: UIView = createView()
    
    var cyanSquare: UIView = {
        let square = UIView(frame: CGRect(x: 0, y: 700, width: 100, height: 100))
        square.backgroundColor = .cyan
        return square
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greenSquare.backgroundColor = .green
        redSquare.backgroundColor = .red
        view.addSubview(cyanSquare)
        ani1()
        ani2()
        basicAni()
        rotate()
        topConstraintAni()
    }

    func basicAni() {
        let ani = CABasicAnimation(keyPath: "position.y")
        ani.fromValue = 0
        ani.toValue = 100
        ani.duration = 1
        redSquare.layer.add(ani, forKey: "aniID")
    }
    
    func ani1() {
        UIView.animate(withDuration: 2, animations: {
            self.greenSquare.backgroundColor = .purple
        })
    }
    
    func rotate(){
        redSquare.transform = CGAffineTransform(rotationAngle: CGFloat.pi/3)
    }
    
    func ani2() {
        UIView.animate(withDuration: 4) {
            self.greenSquare.center = self.view.center
        } completion: { (finished) in
            print("finished")
            UIView.animate(withDuration: 1) {
                self.transition1()
            }
        }
    }
    
    func transition1(){
        UIView.transition(with: greenSquare, duration: 2, options: .transitionCurlUp) {
            self.view.layoutIfNeeded()
        }
    }
    
    func createView() -> UIView {
        let square = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        square.backgroundColor = .cyan
        view.addSubview(square)
        return square
    }

    func topConstraintAni() {
        topConstraint.constant = 400
        UIView.animate(withDuration: 1){
            self.view.layoutIfNeeded()
        } completion: { (finished) in
            if finished {
                UIView.animate(withDuration: 1){
                    self.greenSquare.alpha = 0.5
                    self.heightConstraint.constant = 20
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
}

