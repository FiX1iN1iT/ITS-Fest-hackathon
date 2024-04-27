//
//  WeeklyCalendarViewController.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit
import SnapKit

// MARK: - Delegate Protocol

protocol WeeklyCalendarViewControllerDelegate: AnyObject {
    func didTapDay(_ date: Date)
}

final class WeeklyCalendarViewController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: WeeklyCalendarViewControllerDelegate?
    
    // MARK: - Private Properties
    
    private let monthLabel = UILabel()
    private var weekCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private var calendar: [[Date]] = []
    
    private var selectedCell: (outerIndexPath: IndexPath, innerIndexPath: IndexPath)?
    private var shouldDeselectCell: (outerIndexPath: IndexPath, innerIndexPath: IndexPath)?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension WeeklyCalendarViewController {
    
    // MARK: - Setup
    
    func setup() {
        initProperties()
        setupView()
        setupMonthLabel()
        setupWeekCollectionView()
    }

    func setupView() {
        view.backgroundColor = Constants.backgroundColor
    }
    
    func setupMonthLabel() {
        monthLabel.font = UIFont.systemFont(ofSize: Constants.MonthLabel.fontSize, weight: Constants.MonthLabel.fontWeight)
        monthLabel.textColor = Constants.MonthLabel.textColor
        configureMonthLabel()
        
        view.addSubview(monthLabel)
        monthLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(Constants.MonthLabel.horizontalMargin)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(Constants.MonthLabel.height)
        }
    }
    
    func setupWeekCollectionView() {
        weekCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createSingleColumnFlowLayout(in: view))
        weekCollectionView.dataSource = self
        weekCollectionView.delegate = self
        weekCollectionView.register(WeekCollectionViewCell.self, forCellWithReuseIdentifier: WeekCollectionViewCell.reuseID)
        
        weekCollectionView.backgroundColor = Constants.WeekCollectionView.backgroundColor
        
        weekCollectionView.showsHorizontalScrollIndicator = false
        weekCollectionView.showsVerticalScrollIndicator = false
        weekCollectionView.isPagingEnabled = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self else {
                return
            }
            
            let indexPath = IndexPath(item: calendar.count / 2, section: 0)
            weekCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        }
        
        view.addSubview(weekCollectionView)
        weekCollectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(Constants.WeekCollectionView.height)
        }
    }
    
    // MARK: - Configure
    
    func configureMonthLabel(with date: Date = Date()) {
        monthLabel.text = date.extractDate(with: Constants.MonthLabel.dateFormat)
    }
    
    // MARK: - Init
    
    func initProperties() {
        initCalendar()
        initSelectedCell()
    }
    
    func initCalendar() {
        calendar = CalendarService.shared.fetchWeeklyCalendar(for: Date())
    }
    
    func initSelectedCell() {
        let outerIndexPath = IndexPath(item: calendar.count / 2, section: 0)
        let innerIndex = CalendarService.shared.getWeekdayIndex(from: Date())
        let innerIndexPath = IndexPath(item: innerIndex, section: 0)
        selectedCell = (outerIndexPath, innerIndexPath)
    }
}

// MARK: - CollectionViewDataSource

extension WeeklyCalendarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        calendar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = weekCollectionView.dequeueReusableCell(withReuseIdentifier: WeekCollectionViewCell.reuseID,
                                                                 for: indexPath) as? WeekCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let week = calendar[indexPath.item]
        var selectedIndexPath: IndexPath?
        let first = selectedCell?.outerIndexPath
        let second = shouldDeselectCell?.outerIndexPath
        if first == indexPath && second != indexPath {
            selectedIndexPath = selectedCell?.innerIndexPath
        }
        cell.configure(with: week, and: selectedIndexPath)
        cell.delegate = self
        
        return cell
    }
}

// MARK: - WeekCollectionViewCellDelegate

extension WeeklyCalendarViewController: WeekCollectionViewCellDelegate {
    func didTapDay(_ date: Date) {
        delegate?.didTapDay(date)
        shouldDeselectCell = selectedCell
        if
            let selectedCell = selectedCell,
            let cell = weekCollectionView.cellForItem(at: selectedCell.outerIndexPath) as? WeekCollectionViewCell
        {
            cell.deselectCell()
        }
    }
}

// MARK: - CollectionViewDelegate

extension WeeklyCalendarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if
            let cell = weekCollectionView.cellForItem(at: indexPath) as? WeekCollectionViewCell,
            let innerIndexPath = cell.selectedDayCellIndexPath
        {
            selectedCell = (indexPath, innerIndexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let date = calendar[indexPath.item].first else {
            return
        }
        
        configureMonthLabel(with: date)
    }
}

// MARK: - Constants

private extension WeeklyCalendarViewController {
    struct Constants {
        static let backgroundColor: UIColor = UIColor.backgroundColor
        
        struct WeekCollectionView {
            static let height: CGFloat = 60
            static let backgroundColor: UIColor = .clear
        }
        
        struct MonthLabel {
            static let fontSize: CGFloat = 20
            static let fontWeight: UIFont.Weight = .bold
            static let textColor: UIColor = .label
            static let dateFormat: String = "MMMM"
            static let height: CGFloat = 20
            static let horizontalMargin: CGFloat = 20
        }
    }
}
