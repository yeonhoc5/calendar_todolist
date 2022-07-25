//
//  ViewController.swift
//  220725_TodoList
//
//  Created by YHChoi on 2022/07/25.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {

    @IBOutlet var calendar: FSCalendar!
    var missionDate: [MissionDate] = [] {
        didSet {
            calendar.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCalendar()
    }
    
    func configureCalendar() {
        calendar.appearance.headerTitleColor = .white
        calendar.appearance.headerTitleFont = .systemFont(ofSize: 30, weight: .bold)
        calendar.appearance.headerTitleOffset = CGPoint(x: 0, y: -10)
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        
        calendar.appearance.weekdayTextColor = .init(white: 1, alpha: 0.7)
        calendar.appearance.weekdayFont = .systemFont(ofSize: 17, weight: .bold)
        calendar.locale = Locale(identifier: "ko_KR")
        
        calendar.appearance.titleDefaultColor = .lightGray
        calendar.appearance.titlePlaceholderColor = .init(white: 0.5, alpha: 0.2)
        calendar.appearance.titleWeekendColor = .systemPink
        
        calendar.appearance.todayColor = .init(white: 0.7, alpha: 0.7)
        calendar.appearance.titleTodayColor = .black
        
        calendar.delegate = self
    }

}

extension ViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        guard let tableView = storyboard?.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController else { return }
        let dateFormmater = DateFormatter()
        dateFormmater.locale = Locale(identifier: "ko_KR")
        dateFormmater.dateFormat = "YYYY년 m월 d일"
        tableView.title = dateFormmater.string(from: date)
        
        
        if missionDate.filter{ $0.date == date }.count == 0 {
            missionDate.append(MissionDate(date: date, todoList: []))
        }
        tableView.missionDate = missionDate.filter{ $0.date == date }.first
        
        
        self.present(tableView, animated: true)

    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        <#code#>
    }
    
    
}
