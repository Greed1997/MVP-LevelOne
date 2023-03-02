//
//  MainPresenter.swift
//  MVP - Level One
//
//  Created by Александр on 20.02.2023.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments()
    var comments: [Comment]? { get set }
    func tapOnTheComment(comment: Comment?)
}
class MainPresenter: MainViewPresenterProtocol {
    
    let networkService: NetworkServiceProtocol!
    var comments: [Comment]?
    var router: RouterProtocol? // don't need to be weak because it will fall anyway
    weak var view: MainViewProtocol?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }
    func tapOnTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }

}
