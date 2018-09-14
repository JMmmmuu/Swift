//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
  
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[0].answer
        
        if pickedAnswer == correctAnswer {
            print("You got it!")
        }
        else {
            print("Wrong!")
        }
        
    }
    
    
    func startOver() {
       
    }
    

    
}
