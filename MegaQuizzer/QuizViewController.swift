//
//  QuizViewController.swift
//  MegaQuizzer
//
//  Created by User on 31.07.2021.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var numberQuestionLabel: UILabel!
    
    @IBOutlet weak var textQuestionsLabel: UILabel!
    
    @IBOutlet weak var answerOneOutlet: UIButton!
    @IBOutlet weak var answerTwoOutlet: UIButton!
    @IBOutlet weak var answerThreeOutlet: UIButton!
    @IBOutlet weak var answerFourOutlet: UIButton!
    
    var quiz: Quiz!
    var indexQuestions = 0
    var arrayAnswer: [Bool]!
    var arrayAnswerisTrue: [Bool]!
    var score = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingUI()
        data()
    }
    
    func settingUI() {
        answerOneOutlet.layer.cornerRadius = 10
        answerTwoOutlet.layer.cornerRadius = 10
        answerThreeOutlet.layer.cornerRadius = 10
        answerFourOutlet.layer.cornerRadius = 10
    }
    
    func data() {

        title = quiz.name
        numberQuestionLabel.text = "Вопрос № - \(quiz.questions[indexQuestions].number + 1)"
        
        numberAnswerText(button: answerOneOutlet)
        numberAnswerText(button: answerTwoOutlet)
        numberAnswerText(button: answerThreeOutlet)
        numberAnswerText(button: answerFourOutlet)
    }
    
    func numberAnswerText (button: UIButton) {
        button.titleLabel?.text = quiz.questions[indexQuestions].answers[numberAnswer(sender: button)].answerText
    }
    
    func numberAnswer(sender: UIButton) -> Int{
        switch sender {
        case answerOneOutlet:
            return 0
        case answerTwoOutlet:
            return 1
        case answerThreeOutlet:
            return 2
        default:
            return 3
        }
    }

    
    func nextQuestions() {
        if indexQuestions < quiz.questions.count {
            indexQuestions += 1
        }
    }
    
    @IBAction func answerButtonAction(_ sender: UIButton) {
        sender.backgroundColor = UIColor.yellow
        let number = numberAnswer(sender: sender)
        if quiz.questions[indexQuestions].answers[number].isTrue {
        score += 100
        }
    }
    
    @IBAction func nextButtonAction() {
        nextQuestions()
        data()
   }
}
