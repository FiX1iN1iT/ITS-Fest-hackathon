//
//  WeeklyCalendarViewController.swift
//  ITSFest
//
//  Created by Alexander on 26.04.2024.
//

import UIKit
import SnapKit

final class WeeklyCalendarViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var weekCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private var calendar: [[Date]] = []
    
    private var selectedCell: (outerIndexPath: IndexPath, innerIndexPath: IndexPath)?
    private var shouldDeselectCell: (outerIndexPath: IndexPath, innerIndexPath: IndexPath)?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar = fetchWeeklyCalendar()
        initProperties()
        setup()
    }
}

private extension WeeklyCalendarViewController {
    
    // MARK: - Setup
    
    func setup() {
        setupView()
        setupOuterCollectionView()
    }

    func setupView() {
        view.backgroundColor = Constants.backgroundColor
    }
    
    func setupOuterCollectionView() {
        weekCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createSingleColumnFlowLayout(in: view))
        weekCollectionView.dataSource = self
        weekCollectionView.delegate = self
        weekCollectionView.register(WeekCollectionViewCell.self, forCellWithReuseIdentifier: WeekCollectionViewCell.reuseID)
        
        weekCollectionView.backgroundColor = .clear
        
        weekCollectionView.showsHorizontalScrollIndicator = false
        weekCollectionView.showsVerticalScrollIndicator = false
        weekCollectionView.isPagingEnabled = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self else {
                return
            }
            
            let indexPath = IndexPath(item: 2, section: 0)
            weekCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        view.addSubview(weekCollectionView)
        weekCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Helpers
    
    func fetchWeeklyCalendar() -> [[Date]] {
        let calendar = Calendar.current
        guard
            let startDate = calendar.date(byAdding: .day, value: -14, to: Date()),
            let endDate = calendar.date(byAdding: .day, value: 14, to: Date()),
            let startWeek = calendar.dateInterval(of: .weekOfMonth, for: startDate),
            let endWeek = calendar.dateInterval(of: .weekOfMonth, for: endDate)
        else {
            return []
        }
        
        var start = startWeek.start
        let end = endWeek.start
        
        var weekArray: [[Date]] = []
        while start <= end {
            weekArray.append(fetchWeek(for: start))
            guard let nextDate = calendar.date(byAdding: .day, value: 7, to: start) else {
                return []
            }
            start = nextDate
        }
        
        return weekArray
    }
    
    func fetchWeek(for date: Date = Date()) -> [Date] {
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: date)
        
        guard let firstWeekDay = week?.start else {
            return []
        }
        
        var dateArray: [Date] = []
        (0...6).forEach { day in
            if let weekDay = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                dateArray.append(weekDay)
            }
        }
        
        return dateArray
    }
    
    // MARK: - Init
    
    func initProperties() {
        let outerIndexPath = IndexPath(item: 2, section: 0)
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
//        output.didTapNewDate(date)  // delegate in outer vc
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
}

// MARK: - Constants

private extension WeeklyCalendarViewController {
    struct Constants {
        static let backgroundColor: UIColor = .clear
        
        struct OuterCollectionView {
            static let marginTop: CGFloat = 20
            static let height: CGFloat = 60
        }
    }
}
