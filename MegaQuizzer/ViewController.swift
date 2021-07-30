//
//  ViewController.swift
//  MegaQuizzer
//
//  Created by Максим on 30.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var wuestTextLabel: UILabel!
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    
    let arrayQuestion = [QuestionCard]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsUI()
        dataSelection()
    }
    
    
    private func settingsUI() {
        answerOne.layer.cornerRadius = 10
        answerTwo.layer.cornerRadius = 10
        answerThree.layer.cornerRadius = 10
        answerFour.layer.cornerRadius = 10
    }
    
    private func dataSelection() {
        
    }
    
    @IBAction func answerAction(_ sender: UIButton) {
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
    }
    
}

