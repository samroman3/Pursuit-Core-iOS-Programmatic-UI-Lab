//
//  ViewController.swift
//  ProgrammaticColorGuess
//
//  Created by Sam Roman on 10/8/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: Game Variables
var arrColors = [UIColor.blue,UIColor.red,UIColor.green]
var score = Counter.init(score: 0, highScore: 0)
var red: CGFloat = 0.0
var green: CGFloat = 0.0
var blue: CGFloat = 0.0
var alpha: CGFloat = 0.0
var answer = " "
var input = " "
var count = Counter.init()
    
    
    //TODO: Create programmatic labels and buttons for each storyboard outlet with actions if applicable
    
    
    
    //MARK: UI Setup

//    @IBOutlet weak var colorScreen: UIView!
    
    lazy var colorView: UIView = {
        let myView = UIView(frame: CGRect(x: 60, y: 100, width: 300, height: 300))
        myView.backgroundColor = UIColor.green
        return myView
    }()
    
    @IBOutlet weak var currentScoreLabel: UILabel!
    
    @IBOutlet weak var redlabel: UIButton!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var playAgainLabel: UIButton!
    
    
    
    
//    @IBAction func playAgainButton(_ sender: UIButton) {
//        newColor()
//        gameOverLabel.isHidden = true
//        playAgainLabel.isHidden = true
//    }
    
//
//    @IBAction func redButton(_ sender: UIButton) {
//        input = "red"
//        findValue()
//        checkInput()
//
//    }

//    @IBAction func greenButton(_ sender: UIButton) {
//        input = "green"
//        findValue()
//        checkInput()
//    }
    
    
//
//    @IBAction func blueButton(_ sender: UIButton) {
//        input = "blue"
//        findValue()
//        checkInput()
//    }
//
    
    
    private func setUpViews(){
        self.view.addSubview(colorView)
    }
    
    private func setConstraints() {
            self.colorView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate(
                [colorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 20)])
            }
    
    
    
    //MARK: Game Logic
    //TODO: add all logic to seperate struct
    
    private func newColor(){
        self.colorView.backgroundColor = mixColor()
        
    }
    func mixColor()-> UIColor{
        red = CGFloat.random(in: 0...1)
        green = CGFloat.random(in: 0...1)
        blue = CGFloat.random(in: 0...1)
        alpha = 1.0
        let myColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        return myColor
    }
    func findValue (){
        if red >= green && red >= blue {
           answer = "red"
        } else if green >= red && green >= blue {
           answer = "green"
        } else {
           answer = "blue"
        }
    }
    
    func checkInput() {
        if input == answer {
        count.increment()
        currentScoreLabel.text = "Score : \(count.score)"
        count.highScoreSetter()
            highScoreLabel.text = "High Score : \(count.highScore)"
        newColor()
        
        } else {
        count.highScoreSetter()
        highScoreLabel.text = "High Score : \(count.highScore)"
//        score = 0
        count.reset()
        currentScoreLabel.text = "Score: \(count.score)"
        gameOverLabel.isHidden = false
        playAgainLabel.isHidden = false
        }
    }
    
    
    //MARK: Lifecycle Methods

    override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(colorView)
    self.view.backgroundColor = .systemGray
//    gameOverLabel.isHidden = true
    }

}
