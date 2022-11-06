//
//  ViewController.swift
//  Guess Flag Project 2
//
//  Created by Gökberk Ali Kulaç on 6.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries = ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        askQuestion()
    }
    
    func askQuestion(action:UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) || Your Score is : \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title : String!
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
            questionAsked += 1
            alert(title: title, message: "Your Score Is \(score)")
        }else{
            title = "Wrong"
            score -= 1
            questionAsked += 1
        }
        if questionAsked == 10{
            alert(title: "Game is Over", message: "You ansered ten question your totat score : \(score)")
            score = 0
            questionAsked = 0
        }
        
    }
    
    func alert(title:String,message:String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
}

