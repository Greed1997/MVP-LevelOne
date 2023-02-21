//
//  MainPresenter.swift
//  MVP - Level One
//
//  Created by Александр on 20.02.2023.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}
class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let person: Person
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
}
