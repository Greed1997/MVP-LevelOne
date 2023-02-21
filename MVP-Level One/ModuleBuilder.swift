//
//  ModuleBuilder.swift
//  MVP - Level One
//
//  Created by Александр on 20.02.2023.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController
}

class ModelBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService) // Инджектим снаружи по принципу SOLID и для того, чтобы мы потом смогли заинъектить во view и в person MOC-объект
        view.presenter = presenter
        return view
    }
    static func createDetailModule(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    }
}
