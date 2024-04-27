//
//  DetailProjectViewController.swift
//  ITSFest
//
//  Created by Grigory Don on 26.04.2024.
//
//

import UIKit
import SnapKit

// MARK: - Constants

private enum Constants {
    static let baseTextColor = UIColor.white
    static let backgroundColor = UIColor(hex: "212832")
    static let imageContainerColor = UIColor(hex: "FED36A")
    static let labelContainerColor = UIColor(hex: "8CAAB9")
    
    static let gripOffset: CGFloat = 8
    static let baseOffset: CGFloat = 16
    static let expandedOffset: CGFloat = 32
    static let nameLabelHeight: CGFloat = 60
    
    static let imageHeightWidthRatio: CGFloat = 1.0
    static let labelTopOffset: CGFloat = 4
    static let labelLeftOffset: CGFloat = 12
    static let labelHeightRatio: CGFloat = 0.3
    static let containerHeight: CGFloat = 60
    static let containerWidthMultiplier: CGFloat = 0.45
    
    static let dueDateLabelText = "Due Date"
    static let dueDateContentText = "20 June"
    static let teamLabelText = "Project Team"
    static let labelFontSize: CGFloat = 14
    static let contentFontSize: CGFloat = 20
    static let contentFontWeight = UIFont.Weight.semibold
    static let titleFontWeight = UIFont.Weight.bold
    
    static let calendarSysImage = UIImage(systemName: "calendar")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    static let teamSysImage = UIImage(systemName: "person.2")?.withTintColor(.black, renderingMode: .alwaysOriginal)
}

private enum ContentType {
    case team
    case date
}

// MARK: - DetailProjectViewController

final class DetailProjectViewController: UIViewController {
    
    private let nameLabel = UILabel()
    private let dateContainer = UIView()
    private let teamContainer = UIView()
    private let teamNameLabel = UILabel()
    private let dateNameLabel = UILabel()
    private let dateValueLabel = UILabel()
    private let projDescNameLabel = UILabel()
    private let projDescLabel = UILabel()
    private let projProgressNameLabel = UILabel()
    private let projDateImage = UIImageView()
    private let projTeamImage = UIImageView()
    private let allTasksLabel = UILabel()
    private lazy var taskCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = Constants.backgroundColor
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DetailProjectCell.self, forCellWithReuseIdentifier: "DetailProjectCell")
        return collectionView
    }()
    private let addButton = UIButton()
    let progressBar = CircularProgressBar(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    private let output: DetailProjectViewOutput
    
    init(output: DetailProjectViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavigationController()
    }
}

// MARK: - User Interface

private extension DetailProjectViewController {
    private func setupNavigationController() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: Constants.baseTextColor]
        navigationItem.title = "Project's Details"
    }
    
    func setupUI() {
        [
            nameLabel,
            dateContainer,
            teamContainer,
            teamNameLabel,
            projDescNameLabel,
            projDescLabel,
            projProgressNameLabel,
            allTasksLabel,
            taskCollection,
            addButton,
            progressBar
        ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.backgroundColor = Constants.backgroundColor
        
        makeNameLabel()
        configureUniversalContainer(container: dateContainer, label: dateNameLabel, content: dateValueLabel, image: projDateImage, contentType: .date)
        configureUniversalContainer(container: teamContainer, label: teamNameLabel, content: UILabel(), image: projTeamImage, contentType: .team)
        makeDescription()
        makeProgress()
        makeAllTaskLabel()
        makeCollectionView()
        makeAddButton()
        makeProgressView()
    }
    
    func makeNameLabel() {
        nameLabel.text = "Lorem Ipsum Lorem Ipsum Lorem Ipsum"
        nameLabel.textColor = Constants.baseTextColor
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: Constants.titleFontWeight)
        nameLabel.numberOfLines = 0
        
        nameLabel.snp.makeConstraints { make in
            make.top.left.equalTo(view.safeAreaLayoutGuide).offset(Constants.baseOffset)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-Constants.baseOffset)
            make.height.equalTo(Constants.nameLabelHeight)
        }
    }
    
    func makeDescription() {
        projDescNameLabel.text = "Project Details"
        projDescNameLabel.font = UIFont.systemFont(ofSize: Constants.contentFontSize, weight: .semibold)
        projDescNameLabel.textColor = .white
        projDescNameLabel.textAlignment = .left
        
        projDescLabel.text = ";sld,c;lsd,c;ls,d;lc, ;sl,dc;lsdnidfh ihrifo hsdihsiduhfisudhfiusehfiushdfiu hsdiuf siudhf isuhdf iushdiufhsuidhfisudh fiusdhiu cisdc isd"
        projDescLabel.font = UIFont.systemFont(ofSize: Constants.labelFontSize)
        projDescLabel.textColor = Constants.labelContainerColor
        projDescLabel.textAlignment = .left
        projDescLabel.numberOfLines = 0
        
        projDescNameLabel.snp.makeConstraints { make in
            make.top.equalTo(dateContainer.snp.bottom).offset(Constants.expandedOffset)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(Constants.baseOffset)
        }
        
        projDescLabel.snp.makeConstraints { make in
            make.top.equalTo(projDescNameLabel.snp.bottom).offset(Constants.gripOffset)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(Constants.baseOffset)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-Constants.baseOffset)
        }
    }

    func makeProgress() {
        projProgressNameLabel.text = "Project Progress"
        projProgressNameLabel.font = UIFont.systemFont(ofSize: Constants.contentFontSize, weight: .semibold)
        projProgressNameLabel.textColor = .white

        projProgressNameLabel.snp.makeConstraints { make in
            make.top.equalTo(projDescLabel.snp.bottom).offset(Constants.expandedOffset)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(Constants.baseOffset)
        }
    }

    func makeProgressView() {
        configureProgressBar(numOfCompletedTasks: 8, allTasksNum: 26)
        progressBar.snp.makeConstraints { make in
            make.centerY.equalTo(projProgressNameLabel.snp.centerY)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-Constants.baseOffset)
            make.width.height.equalTo(50)
        }
    }

    
    func makeAllTaskLabel() {
        allTasksLabel.text = "All Tasks"
        allTasksLabel.font = UIFont.systemFont(ofSize: Constants.contentFontSize, weight: .semibold)
        allTasksLabel.textColor = .white
        
        allTasksLabel.snp.makeConstraints { make in
            make.top.equalTo(projProgressNameLabel.snp.bottom).offset(Constants.expandedOffset)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(Constants.baseOffset)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-Constants.baseOffset)
        }
    }
    
    func configureUniversalContainer(container: UIView, label: UILabel, content: UILabel, image: UIImageView, contentType: ContentType) {
        let imagePlacehoder = UIView()
        
        [label, content, imagePlacehoder, image].forEach {
            container.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        imagePlacehoder.backgroundColor = Constants.imageContainerColor
        
        image.backgroundColor = Constants.imageContainerColor
        label.textColor = Constants.labelContainerColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: Constants.labelFontSize)
        
        content.textColor = Constants.baseTextColor
        content.textAlignment = .left
        content.font = UIFont.systemFont(ofSize: Constants.contentFontSize, weight: Constants.contentFontWeight)
        
        switch contentType {
        case .date:
            label.text = Constants.dueDateLabelText
            content.text = Constants.dueDateContentText
            image.image = Constants.calendarSysImage
            
            container.snp.makeConstraints { make in
                make.top.equalTo(nameLabel.snp.bottom).offset(Constants.expandedOffset)
                make.left.equalTo(self.view.safeAreaLayoutGuide).offset(Constants.baseOffset)
                make.width.equalTo(self.view.safeAreaLayoutGuide).multipliedBy(Constants.containerWidthMultiplier)
                make.height.equalTo(Constants.containerHeight)
            }
        case .team:
            label.text = Constants.teamLabelText
            image.image = Constants.teamSysImage
            
            container.snp.makeConstraints { make in
                make.top.equalTo(nameLabel.snp.bottom).offset(Constants.expandedOffset)
                make.right.equalTo(self.view.safeAreaLayoutGuide).offset(-Constants.baseOffset)
                make.width.equalTo(self.view.safeAreaLayoutGuide).multipliedBy(Constants.containerWidthMultiplier)
                make.height.equalTo(Constants.containerHeight)
            }
        }
        
        imagePlacehoder.snp.makeConstraints { make in
            make.top.left.equalTo(container)
            make.height.width.equalTo(container.snp.height)
        }
        
        image.snp.makeConstraints { make in
            make.center.equalTo(imagePlacehoder.snp.center)
            make.width.equalTo(imagePlacehoder.snp.width).multipliedBy(0.5)
            make.height.equalTo(imagePlacehoder.snp.height).multipliedBy(0.45)
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(container).offset(Constants.labelTopOffset)
            make.left.equalTo(imagePlacehoder.snp.right).offset(Constants.labelLeftOffset)
            make.height.equalTo(container.snp.height).multipliedBy(Constants.labelHeightRatio)
        }
        
        content.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom)
            make.left.equalTo(imagePlacehoder.snp.right).offset(Constants.labelLeftOffset)
            make.bottom.equalTo(container)
        }
    }
    
    private func configureProgressBar(numOfCompletedTasks: Float, allTasksNum: Float) {
        progressBar.setProgressWithAnimation(duration: 1.0, value: numOfCompletedTasks / allTasksNum)
    }
    
    func makeCollectionView() {
        taskCollection.snp.makeConstraints { make in
            make.top.equalTo(allTasksLabel.snp.bottom).offset(Constants.baseOffset)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(Constants.baseOffset)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-Constants.baseOffset)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-60)
        }
    }
    
    func makeAddButton() {
        addButton.backgroundColor = Constants.imageContainerColor
        addButton.setTitle("Add Task", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        addButton.setTitleColor(.black, for: .normal)
        
        addButton.snp.makeConstraints { make in
            make.top.equalTo(taskCollection.snp.bottom).offset(Constants.baseOffset)
            make.left.equalTo(view.snp.left).offset(40)
            make.right.equalTo(view.snp.right).offset(-40)
            make.bottom.equalTo(view.snp.bottom).offset(-32)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension DetailProjectViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailProjectCell", for: indexPath) as? DetailProjectCell else {
            fatalError("Unable to dequeue DetailProjectCell")
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension DetailProjectViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension DetailProjectViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.size.width, height: 40)
    }
}

// MARK: - DetailProjectViewController

extension DetailProjectViewController: DetailProjectViewInput {
}
