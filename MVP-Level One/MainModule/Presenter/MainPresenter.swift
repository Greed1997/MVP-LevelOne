//
//  MainPresenter.swift
//  MVP - Level One
//
//  Created by Александр on 20.02.2023.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getComments()
    var comments: [Comment]? { get set }
}
class MainPresenter: MainViewPresenterProtocol {
    
    let networkService: NetworkServiceProtocol!
    var comments: [Comment]?
    weak var view: MainViewProtocol?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
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
