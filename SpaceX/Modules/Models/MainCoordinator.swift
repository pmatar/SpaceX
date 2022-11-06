//
//  MainCoordinator.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import UIKit

final class MainCoordinator: BaseCoordinator {
        
    override func start() {
        let viewModel = MainViewModel(self, service: ApiService())
        let viewController = MainViewController(viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func openDetailsScreen(id: String) {
        let viewModel = DetailsViewModel(self, service: ApiService())
        let viewController = DetailsViewController(viewModel)
        viewController.modalPresentationStyle = .fullScreen
        navigationController.present(viewController, animated: true)
    }
}
