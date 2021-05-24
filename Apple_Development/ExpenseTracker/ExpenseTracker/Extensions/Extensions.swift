//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by SUBHASISH BISWAS on 08/01/21.
//

import UIKit

class Extensions: NSObject {

}

extension Date {
    func startOfMonth() -> Date? {
        let comp: DateComponents = Calendar.current.dateComponents([.year, .month, .hour], from: Calendar.current.startOfDay(for: self))
        return Calendar.current.date(from: comp)!
    }

    func endOfMonth() -> Date? {
        var comp: DateComponents = Calendar.current.dateComponents([.month, .day, .hour], from: Calendar.current.startOfDay(for: self))
        comp.month = 1
        comp.day = -1
        return Calendar.current.date(byAdding: comp, to: self.startOfMonth()!)
    }
    
    
}

extension Date {
    func startDateOfTheYear() -> Date? {
        
        var components = Calendar.current.dateComponents([.year], from: Date())
        components.year = components.year
        components.month = 1
        components.day = 1
        guard let startDateOfYear = Calendar.current.date(from: components)?.dateInLocalTimeZone() else { return Date()}
        return startDateOfYear
    }

    func endDateOfTheYear() -> Date? {
        var components = Calendar.current.dateComponents([.year], from: Date())
        components.year = 1
        components.day = -1
        
        guard let lastDateOfYear = Calendar.current.date(byAdding: components, to: self.startDateOfTheYear()!)?.dateInLocalTimeZone() else { return Date()}
        return lastDateOfYear
    }
    
    
}


extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    
}

extension Date {

    func getDaysInMonth() -> Int{
        let calendar = Calendar.current

        let dateComponents = DateComponents(year: calendar.component(.year, from: self), month: calendar.component(.month, from: self))
        let date = calendar.date(from: dateComponents)!

        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count

        return numDays
    }

}

extension Date {
    func localDate() -> Date {
        let nowUTC = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else {return Date()}

        return localDate
    }
}

extension Date {
    func dateInLocalTimeZone() -> Date {
        let nowUTC = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: self) else {return Date()}

        return localDate
    }
}

class DateExtension
{
    static let cardDateFormatter: DateFormatter =
        {
            let cardDateFormatter = DateFormatter()
            cardDateFormatter.timeZone = .current
            cardDateFormatter.locale = .current
            cardDateFormatter.dateStyle = .medium
            cardDateFormatter.timeStyle = .none
            cardDateFormatter.dateFormat = "dd-MMM-yyyy"
            return cardDateFormatter
        }()
    
    static func GetDate(stringDate : String) -> Date?
    {
        let months = ["Jan":1,"Feb":2,"Mar":3,"Apr":4,"May":5,"Jun":6,"Jul":7,"Aug":8,"Sep":9,"Oct":10,"Nov":11,"Dec":12]
        let textDateComponents = stringDate.components(separatedBy: "-")
        var calendar = Calendar.current
        calendar.timeZone = .current
        
        let currentDateComponents = calendar.dateComponents([.calendar, .timeZone,.hour, .minute, .second],from: Date())
        
        let dateComponents = DateComponents(calendar: calendar,
                                            year: Int(textDateComponents[2]),
                                            month: months[textDateComponents[1]],
                                            day: Int(textDateComponents[0]),
                                            hour: currentDateComponents.hour!,
                                            minute: currentDateComponents.minute,
                                            second: currentDateComponents.second
        )
        let date = calendar.date(from: dateComponents)!
        
        return date
    }
    
    static func GetDateFromString(stringDate : String) -> Date?
    {
        let months = ["Jan":1,"Feb":2,"Mar":3,"Apr":4,"May":5,"Jun":6,"Jul":7,"Aug":8,"Sep":9,"Oct":10,"Nov":11,"Dec":12]
        let textDateComponents = stringDate.components(separatedBy: "-")
        var calendar = Calendar.current
        calendar.timeZone = .current
    
        let dateComponents = DateComponents(calendar: calendar,
                                            year: Int(textDateComponents[2]),
                                            month: months[textDateComponents[1]],
                                            day: Int(textDateComponents[0]),
                                            hour: 0,
                                            minute: 0,
                                            second: 0
        )
        let date = calendar.date(from: dateComponents)!
        
        return date
    }

}

extension UIDatePicker
{
     func GetDate() -> Date {
        
        let components =
            self.calendar.dateComponents([.day,.month,.year,.hour,.minute,.second], from: self.date)
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar.date(from: components)!
        
    }
}




