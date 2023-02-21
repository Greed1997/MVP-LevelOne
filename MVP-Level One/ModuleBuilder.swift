//
//  ModuleBuilder.swift
//  MVP - Level One
//
//  Created by Александр on 20.02.2023.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let module = Person(firstName: "Tim", lastName: "Cook")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: module) // Инджектим снаружи по принципу SOLID и для того, чтобы мы потом смогли заинъектить во view и в person MOC-объект
        view.presenter = presenter
        return view
    }
}
