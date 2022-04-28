//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Maksim Grischenko on 26.04.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateResult()
        
        navigationItem.hidesBackButton = true
       
    }
}

extension ResultViewController {
        
    private func updateResult () {
//        var allAnimalsInAnswers: [Animal: Int] = [:]
//        let animals = answers.map { $0.animal }
//
//        for animal in animals {
//            if let countAnimal = allAnimalsInAnswers[animal] {
//                allAnimalsInAnswers.updateValue(countAnimal + 1, forKey: animal)
//            } else {
//                allAnimalsInAnswers[animal] = 1
//            }
//        }
//        Можно сократить цикл следующим образом:
//        Присваиваем значение в словарь по ключу animal, если ключ со значением есть, то прибавляем 1, если ключа со значением нет, то присваиваем 0 и прибавляем 1.
/*
          for animal in animals {
 let allAnimalInAnswers[animal] = (allAnimalInAnswers[animal] ?? 0) + 1
 }
 */

//        let sortedAllAnimalsInAnswers = allAnimalsInAnswers.sorted { $0.value > $1.value }
//        guard let mostPopularAnimal = sortedAllAnimalsInAnswers.first?.key else { return }
//        Решение в одну строку, создаем словарь из массива из значений animal, сортируем по убыванию и берем ключ с самым большим значением
        let mostPopularAnimal = Dictionary(grouping: answers) { $0.animal }.sorted { $0.value.count > $1.value.count } .first?.key
        updateUI(with: mostPopularAnimal)
    }
    
    private func updateUI(with animal: Animal?) {
        resultLabel.text = "Вы - \(animal?.rawValue ?? "🐶")"
        descriptionLabel.text = "\(animal?.definition ?? "")"
    }
}

