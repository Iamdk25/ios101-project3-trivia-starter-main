//
//  choicesViewController.swift
//  Trivia
//
//  Created by Divyarajsinh Karmariya on 10/6/23.
//

import UIKit

class ChoicesViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    var currentQuestionIndex = 0
    struct Question {
        let text: String
        let options: [String]
        let correctAnswerIndex: Int
    }

    let questions: [Question] = [
        Question(text: "What is the capital of France?", options: ["Berlin", "Madrid", "Paris", "Rome"], correctAnswerIndex: 2),
        Question(text: "Who is the president of USA?", options: ["Trump", "Biden", "Obama", "Churchill"], correctAnswerIndex: 2),
        Question(text: "What is the color of Water?", options: ["Blue", "Black", "Green", "Orange"], correctAnswerIndex: 1),
        Question(text: "Where is the Sillicon Valley Located?", options: ["Utah", "Florida", "Washington", "California"], correctAnswerIndex: 4),
        // Add more questions here as needed
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
    }
    
    func loadQuestion() {
        let question = questions[currentQuestionIndex]
        questionLabel.text = question.text
        button1.setTitle(question.options[0], for: .normal)
        button2.setTitle(question.options[1], for: .normal)
        button3.setTitle(question.options[2], for: .normal)
        button4.setTitle(question.options[3], for: .normal)
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let question = questions[currentQuestionIndex]
        if sender.tag == question.correctAnswerIndex {
            // Correct answer, handle it here (e.g., update score)
            print("Correct!")
        } else {
            // Wrong answer, handle it here (e.g., show an error message)
            print("Wrong!")
        }
        
        // Load the next question
        currentQuestionIndex += 1
        if currentQuestionIndex < questions.count {
            loadQuestion()
        } else {
            // No more questions, you can end the game or show a summary
            print("No more questions")
        }
    }
}
