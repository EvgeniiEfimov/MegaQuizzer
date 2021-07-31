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
    
    var quiz = QuizDataManager.shared.getQuizzes()[0] //времянка для теста
    
    var indexQuestions = 0
    var score = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingUI()
        data()
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard <#condition#> else {
//            <#statements#>
//        }
//    }
    
    func settingUI() {
        answerOneOutlet.layer.cornerRadius = 10
        answerTwoOutlet.layer.cornerRadius = 10
        answerThreeOutlet.layer.cornerRadius = 10
        
        
    }
    
    func data() {
        
        numberQuestionLabel.text = "Вопрос № - \(indexQuestions + 1)"
        textQuestionsLabel.text = quiz.questions[indexQuestions].questionText
        
        numberAnswerText(button: answerOneOutlet, indexAnswer: 0)
        numberAnswerText(button: answerTwoOutlet, indexAnswer: 1)
        numberAnswerText(button: answerThreeOutlet, indexAnswer: 2)
    }
    
    func numberAnswerText (button: UIButton, indexAnswer: Int) {
        button.setTitle(quiz.questions[indexQuestions].answers[indexAnswer].answerText, for: .normal)
    }
    
    
    func nextQuestions() {
        if indexQuestions < quiz.questions.count {
            indexQuestions += 1
        }
    }
    
    @IBAction func answerButtonAction(_ sender: UIButton) {
        if sender.backgroundColor == UIColor.white {
            sender.backgroundColor = UIColor.yellow
        } else if sender.backgroundColor == UIColor.yellow {
        sender.backgroundColor = UIColor.white
        }
    }
    
    func check(button: UIButton, indexAnswer: Int) {
         guard button.backgroundColor == UIColor.yellow else { return }
         quiz.questions[indexQuestions].answers[indexAnswer].isTrue ?
            (score += 100) : (score -= 50)
        button.backgroundColor = UIColor.white
    }
    
    @IBAction func nextButtonAction() {
        check(button: answerOneOutlet, indexAnswer: 0)
        check(button: answerTwoOutlet, indexAnswer: 1)
        check(button: answerThreeOutlet, indexAnswer: 2)
        
        nextQuestions()
        data()
        
        print(score)
   }
}
