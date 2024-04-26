//
//  WeekCollectionViewCell.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit
import SnapKit

// MARK: - Delegate Protocol

protocol WeekCollectionViewCellDelegate: AnyObject {
    func didTapDay(_ date: Date)
}

class WeekCollectionViewCell: UICollectionViewCell {
    static let reuseID = "WeekCollectionViewCell"
    
    weak var delegate: WeekCollectionViewCellDelegate?
    
    private var dayCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private var week: [Date] = []
    private(set) var selectedDayCellIndexPath: IndexPath?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Interface
    
    func configure(with week: [Date], and selectedCellIndexPath: IndexPath? = nil) {
        self.week = week
        self.selectedDayCellIndexPath = selectedCellIndexPath
        dayCollectionView.reloadData()
        selectCollectionViewCellsIfNeeded()
    }
    
    func deselectCell() {
        if let indexPath = selectedDayCellIndexPath {
            dayCollectionView.deselectItem(at: indexPath, animated: false)
            selectedDayCellIndexPath = nil
        }
    }
}

private extension WeekCollectionViewCell {
    
    // MARK: - Setup
    
    func setup() {
        setupView()
        setupDayCollectionView()
    }
    
    func setupView() {
        backgroundColor = Constants.backgroundColor
    }
    
    func setupDayCollectionView() {
        dayCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createSevenColumnFlowLayout(in: self))
        dayCollectionView.delegate = self
        dayCollectionView.dataSource = self
        dayCollectionView.register(DayCollectionViewCell.self, forCellWithReuseIdentifier: DayCollectionViewCell.reuseID)
        
        dayCollectionView.backgroundColor = Constants.InnerCollectionView.backgroundColor
        
        dayCollectionView.showsHorizontalScrollIndicator = false
        dayCollectionView.showsVerticalScrollIndicator = false
        
        addSubview(dayCollectionView)
        dayCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Helpers
    
    func selectCollectionViewCellsIfNeeded() {
        for indexPath in dayCollectionView.indexPathsForSelectedItems ?? [] {
            dayCollectionView.deselectItem(at: indexPath, animated: false)
        }
        dayCollectionView.selectItem(at: selectedDayCellIndexPath, animated: false, scrollPosition: [])
    }
}

// MARK: - CollectionViewDataSource

extension WeekCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        week.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCollectionViewCell.reuseID,
                                                            for: indexPath) as? DayCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let date = week[indexPath.item]
        let viewModel = DayCollectionViewCellViewModel(date: date)
        cell.configure(with: viewModel)
        
        return cell
    }
}

// MARK: - CollectionViewDelegate

extension WeekCollectionViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedDayCellIndexPath != indexPath {
            delegate?.didTapDay(week[indexPath.item])
            selectedDayCellIndexPath = indexPath
        }
    }
}

// MARK: - Constants

private extension WeekCollectionViewCell {
    struct Constants {
        static let backgroundColor: UIColor = .clear
        
        struct InnerCollectionView {
            static let backgroundColor: UIColor = .clear
        }
    }
}
