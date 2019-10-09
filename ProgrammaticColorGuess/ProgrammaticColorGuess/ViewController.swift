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
var arrColors = [UIColor.blue, UIColor.red, UIColor.green]
var score = Counter.init(score: 0, highScore: 0)
var red: CGFloat = 0.0
var green: CGFloat = 0.0
var blue: CGFloat = 0.0
var alpha: CGFloat = 0.0
var answer = ""
var input = ""
var count = Counter.init()
    
    
    //TODO: Create programmatic labels and buttons for each storyboard outlet with actions if applicable
    
    
    
    //MARK: UI Setup

//    @IBOutlet weak var colorScreen: UIView!
    
    lazy var colorView: UIView = {
        let myView = UIView(frame: CGRect(x: 60, y: 100, width: 300, height: 300))
        myView.backgroundColor = UIColor.green
        return myView
    }()
    
//    @IBOutlet weak var currentScoreLabel: UILabel!
    lazy var currentScoreLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 2, y: 10, width: 300, height: 90))
        label.text = "Score: 0"
        label.textColor = .white
        return label
    }()
    
    

    
//    @IBOutlet weak var highScoreLabel: UILabel!
    lazy var highScoreLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 2, y: 30, width: 300, height: 90))
        label.text = "High Score: 0"
        label.textColor = .white
        return label
    }()
    
    
//    @IBOutlet weak var gameOverLabel: UILabel!
    
    lazy var gameOverLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 700, width: 100, height: 50))
        label.text = " Game Over"
        label.textColor = .white
        return label
    }()
    
    
    
    
    
//    @IBOutlet weak var playAgainLabel: UIButton!
    
    lazy var playAgainLabel: UIButton = {
        let button = UIButton(frame: CGRect(x: 150, y: 800, width: 100, height: 50))
        button.setTitle("Play Again?", for: .normal)
        button.addTarget(self, action: #selector(playAgainPressed(sender: )), for: .touchUpInside)
        return button
    }()
    
    @objc func playAgainPressed(sender: UIButton){
         newColor()
         gameOverLabel.isHidden = true
         playAgainLabel.isHidden = true
    }
    
//    @IBAction func playAgainButton(_ sender: UIButton) {
//        newColor()
//        gameOverLabel.isHidden = true
//        playAgainLabel.isHidden = true
//    }
    
//
    

    
    lazy var redButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 60, y: 480, width: 80, height: 80))
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(redPressed(sender: )), for: .touchUpInside)
        return button
    }()
    
    @objc func redPressed(sender: UIButton){
        input = "red"
        findValue()
        checkInput()
       }

//    @IBAction func greenButton(_ sender: UIButton) {
//        input = "green"
//        findValue()
//        checkInput()
//    }
    
    lazy var greenButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 170, y: 480, width: 80, height: 80))
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(greenPressed(sender: )), for: .touchUpInside)
        return button
    }()
    
    @objc func greenPressed(sender: UIButton){
     input = "green"
     findValue()
     checkInput()
    }
    
    lazy var blueButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 280, y: 480, width: 80, height: 80))
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(bluePressed(sender: )), for: .touchUpInside)
        return button
    }()
    
    @objc func bluePressed(sender: UIButton){
     input = "blue"
     findValue()
     checkInput()
    }
    
    
    private func setUpViews(){
        self.view.addSubview(colorView)
        self.view.addSubview(currentScoreLabel)
        self.view.addSubview(gameOverLabel)
        self.view.addSubview(highScoreLabel)
        self.view.addSubview(playAgainLabel)
        self.view.addSubview(redButton)
        self.view.addSubview(greenButton)
        self.view.addSubview(blueButton)



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
    newColor()
    super.viewDidLoad()
    setUpViews()
    self.view.backgroundColor = .systemGray
    gameOverLabel.isHidden = true
    playAgainLabel.isHidden = true
    }

}
