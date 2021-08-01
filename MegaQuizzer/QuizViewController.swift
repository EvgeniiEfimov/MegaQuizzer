//
//  QuizViewController.swift
//  MegaQuizzer
//
//  Created by Evgenii Efimov on 31.07.2021.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var numberQuestionLabel: UILabel!
    
    @IBOutlet weak var quizName: UILabel!
    
    @IBOutlet weak var textQuestionsLabel: UILabel!
        
    @IBOutlet var answerButtonArray: [UIButton]!
    
    
    var quiz = QuizDataManager.shared.getQuizzes()[0] //времянка для теста!!!!!!!
    var score = 0
    var name: String!
    
    private var indexQuestions = 0
    private var arrayAnswerPerson: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingUI()
        data()
        numberAnswerText()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultVC else { return }
        resultVC.userName = name
        resultVC.result = score
    }
    
    @IBAction func answerButtonAction(_ sender: UIButton) {
            sender.backgroundColor == UIColor.white ?
            (sender.backgroundColor = UIColor.yellow) :
            (sender.backgroundColor = UIColor.white)
    }
    
    @IBAction func nextButtonAction() {
        if quiz.questions.count > indexQuestions {
            check()
            if arrayAnswerPerson.count == 0 {
                alertPresent()
            } else {
                nextQuestions()
                data()
            }
        print(score)
        } else {
            performSegue(withIdentifier: "ResultVC", sender: nil) // <- переход на результат
        }
   }
   private func settingUI() {
        for answerButton in answerButtonArray {
            answerButton.layer.cornerRadius = 10
            answerButton.isHidden = true
        }
    quizName.text = "Категория: \n\(quiz.name)"
        
    }
    
   private func data() {
        numberQuestionLabel.text = "Вопрос № - \(indexQuestions + 1)"
        textQuestionsLabel.text = quiz.questions[indexQuestions].questionText
        numberAnswerText()
            }
    
   private func numberAnswerText () {
        for (index,value) in quiz.questions[indexQuestions].answers.enumerated() {
            answerButtonArray[index].setTitle(value.answerText, for: .normal)
            answerButtonArray[index].isHidden = false
        }
    }
    
    private func nextQuestions() {
        if indexQuestions < quiz.questions.count {
            indexQuestions += 1
            arrayAnswerPerson.removeAll()
        }
    }
    private func alertPresent() {
        let alert = UIAlertController(title: nil,
                                      message:  "А ответ кто будет выбиарть?",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Я",
                                      style: .cancel,
                                      handler: nil))
        self.present(alert,
                     animated: true,
                     completion: nil)
        }
    
    private func check() {
        for (index, value) in answerButtonArray.enumerated() {
            if value.backgroundColor == UIColor.yellow {
            arrayAnswerPerson.append(value)
            quiz.questions[indexQuestions].answers[index].isTrue ?
                (score += 100) : (score -= 50)
                value.backgroundColor = UIColor.white
            }
        }
    }
}
