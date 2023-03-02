//
//  DetailViewController.swift
//  MVP-Level One
//
//  Created by Александр on 21.02.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var commentLabel: UILabel!
    
    var presenter: DetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }
    
    @IBAction func tapAction(_ sender: Any) {
        presenter.tap() // 1) View say to Presenter that button did tapped; 2) Presenter do it method tap() {router.popToRoot()}; 3) Попка исполнит метод из Router и переведет пользователя на начальный экран
    }
    

}
extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
