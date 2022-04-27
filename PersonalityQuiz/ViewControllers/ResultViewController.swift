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
    
    var answers: [Answer] = []
    
    private var dogCount = 0
    private var catCount = 0
    private var turtleCount = 0
    private var rabbitCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countAnimalType()
        updateResult()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
       
    }
}

extension ResultViewController {
    
    private func countAnimalType () {
        for answer in answers {
            if answer.animal == .dog {
                dogCount += 1
            } else if answer.animal == .cat {
                catCount += 1
            } else if answer.animal == .rabbit {
                rabbitCount += 1
            } else {
                turtleCount += 1
            }
        }
    }
    
    private func updateResult () {
        if dogCount > catCount && dogCount > turtleCount && dogCount > rabbitCount {
            resultLabel.text = "Вы - \(Animal.dog.rawValue)"
            descriptionLabel.text = Animal.dog.definition
        } else if catCount > dogCount && catCount > turtleCount && catCount > rabbitCount {
            resultLabel.text = "Вы - \(Animal.cat.rawValue)"
            descriptionLabel.text = Animal.dog.definition
        } else if turtleCount > dogCount && turtleCount > catCount && turtleCount > rabbitCount {
            resultLabel.text = "Вы - \(Animal.turtle.rawValue)"
            descriptionLabel.text = Animal.turtle.definition
        } else {
            resultLabel.text = "Вы - \(Animal.rabbit.rawValue)"
            descriptionLabel.text = Animal.rabbit.definition
        }
    }
}

