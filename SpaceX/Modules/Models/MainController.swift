//
//  ViewController.swift
//  SpaceX
//
//  Created by Paul Matar on 02/11/2022.
//

import UIKit

final class MainController: UIViewController {
    
    private let viewModel: MainViewModelProtocol
    
    private lazy var collectionView: LaunchCollectionView = {

        let collectionView = LaunchCollectionView()
        collectionView.backgroundColor = UIColor.red
        
        collectionView.place(on: view).pin(
            .top(to: view.safeAreaLayoutGuide, padding: 15),
                .fixedHeight(250),
            .leading,
            .trailing
        )
        return collectionView
    }()
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        addCollection()
    }

    init(_ viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainController {
    
    private func setupNavBar() {
        
        let titleLabel = UILabel()
        titleLabel.text = "Launches"
        titleLabel.font = UIFont(name: C.Fonts.latoBold, size: 25)

        let leftSpacer = UIBarButtonItem(customView:
                .init(frame: .init(x: 0, y: 0, width: 7, height: 0))
        )
        
        navigationItem.leftBarButtonItems = [leftSpacer, .init(customView: titleLabel)]
        
        let searchButton = UIButton(type: .custom)
        let searchImage = UIImage(named: C.Images.search)
        searchButton.setImage(searchImage, for: .normal)
        searchButton.frame = .init(x: 0, y: 0, width: 16, height: 16)
        
        let bellImage = UIImage(named: C.Images.bell)
        let bellButton = BadgeButton()
        bellButton.showBadge(text: "2")
        bellButton.setImage(bellImage, for: .normal)
        
        let stackView = UIStackView(arrangedSubviews: [searchButton, bellButton])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 35
        
        let rightStackView = UIBarButtonItem(customView: stackView)
        let rightSpacer = UIBarButtonItem(customView:
                .init(frame: .init(x: 0, y: 0, width: 7, height: 0))
        )

        navigationItem.rightBarButtonItems = [rightSpacer, rightStackView]
    }
    
}

// MARK: - CollectionView Delegate and Data Source

extension MainController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func addCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchCell.reuseIdentifier, for: indexPath) as? LaunchCell ?? LaunchCell()
        cell.backgroundColor = .blue
        return cell
    }
}
