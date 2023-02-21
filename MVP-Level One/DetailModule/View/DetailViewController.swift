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

}
extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        self.commentLabel.text = comment?.body
    }
}
