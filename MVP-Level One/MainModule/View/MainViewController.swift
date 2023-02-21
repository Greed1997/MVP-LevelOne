//
//  MainViewController.swift
//  MVP - Level One
//
//  Created by Александр on 20.02.2023.
//

import UIKit
protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}
class MainViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var greetingLabel: UILabel!
    
    var presenter: MainViewPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // MARK: - @IBAction
    @IBAction func didTapButtonAction(_ sender: Any) {
        self.presenter.showGreeting()
    }
}
// MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}

