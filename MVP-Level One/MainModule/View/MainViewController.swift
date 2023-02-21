//
//  MainViewController.swift
//  MVP - Level One
//
//  Created by Александр on 20.02.2023.
//

import UIKit
protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}
class MainViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainViewPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let comment = presenter.comments?[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = comment?.body
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let comment = presenter.comments?[indexPath.row]
        let detailVC = ModelBuilder.createDetailModule(comment: comment)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
// MARK: - MainViewProtocol
extension MainViewController: MainViewProtocol {
    func succes() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
}

