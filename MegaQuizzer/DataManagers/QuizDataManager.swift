//
//  QuizManager.swift
//  MegaQuizzer
//
//  Created by Kristina Shlyapkina on 30.07.2021.
//

import Foundation

class QuizDataManager {

    static let shared = QuizDataManager()

    private var quizzes: [Quiz] = []

    func saveQuiz(quiz: Quiz) {
        quizzes.append(quiz)
    }

    func getQuizzes() -> [Quiz] {
        return quizzes
    }

    private init() {
        quizzes.append(
            Quiz(name: "Кино",
                 questions:
                    [
                        QuestionCard(questionText: "В каком веке был изобретен кинематограф?",
                                     answers: [
                                        Answer(answerText: "В XVII веке", isTrue: false),
                                        Answer(answerText: "В XIX веке", isTrue: true),
                                        Answer(answerText: "В XX веке", isTrue: false)
                                     ]),

                        QuestionCard(questionText: "Что изначально отсутствовало в кинофильмах?",
                                     answers: [
                                        Answer(answerText: "Звук", isTrue: true),
                                        Answer(answerText: "Актеры", isTrue: false),
                                        Answer(answerText: "Сюжет", isTrue: false)
                                     ]),

                        QuestionCard(questionText: "Как назывался первый цветной фильм, раскрашенный вручную?",
                                     answers: [
                                        Answer(answerText: "Кинемаколор", isTrue: false),
                                        Answer(answerText: "Путешествие на луну", isTrue: true),
                                        Answer(answerText: "Змеиный танец", isTrue: false)
                                     ]),

                        QuestionCard(questionText: "Какова была средняя длина фильмов в начале XX века?",
                                     answers: [
                                        Answer(answerText: "15 минуты", isTrue: true),
                                        Answer(answerText: "3 минуты", isTrue: false),
                                        Answer(answerText: "1 час", isTrue: false)
                                     ]),

                        QuestionCard(questionText: "В каком году был снят первый российский цветной кинофильм?",
                                     answers: [
                                        Answer(answerText: "1907", isTrue: false),
                                        Answer(answerText: "1913", isTrue: false),
                                        Answer(answerText: "1931", isTrue: true)
                                     ]),

                        QuestionCard(questionText: "Что характерно для немого кино?",
                                     answers: [
                                        Answer(answerText: "Отсутствие диалогов в сюжете", isTrue: false),
                                        Answer(answerText: "Отсутствие звуковой дорожки с речью актеров", isTrue: true),
                                        Answer(answerText: "Полное отсутствие звуковой дорожки", isTrue: false)
                                     ])
                    ]))
    }
}
