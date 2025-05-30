//
//  misc.swift
//  danreps
//
//  Created by Daniel Francis on 2/1/25.
//

import Foundation

public extension Date {
    /// Returns the date with time set to midnight (00:00:00)
    var dateOnly: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: self)
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self) ?? Date()
    }
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self) ?? Date()
    }
    var danFormat: String {
        //let n = LastDone!.formatted(date: .numeric, time: .omitted)
        //let c = LastDone!.formatted(date: .complete, time: .omitted)
        //let l = LastDone!.formatted(date: .long, time: .omitted)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" // Specify the format
        return formatter.string(from: self)
    }
    var hasTimePart: Bool {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: self)

        return (components.hour != 0 || components.minute != 0 || components.second != 0)
    }
    var shortDateTime: String {
        let formatter = DateFormatter()
        if (hasTimePart) {
            formatter.dateFormat = "yy-MM-dd HH:mm"
        } else {
            formatter.dateFormat = "yy-MM-dd"
        }
        
        return formatter.string(from: self)
    }
    var shortTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss" // Specify the format
        //formatter.timeStyle = .medium

        return formatter.string(from: self)
    }
}
