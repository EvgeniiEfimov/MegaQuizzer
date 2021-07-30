//
//  QuizManager.swift
//  MegaQuizzer
//
//  Created by Kristina Shlyapkina on 30.07.2021.
//

import Foundation

class QuizDataManager {

    static let shared = QuizDataManager()

    var quizzes: [Quiz] = []

    private init() {}
}
