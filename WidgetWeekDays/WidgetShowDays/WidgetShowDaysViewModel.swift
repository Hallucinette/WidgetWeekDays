//
//  WidgetShowDaysViewModel.swift
//  WidgetWeekDays
//
//  Created by Amelie Pocchiolo on 22/11/2023.
//

import Foundation
import SwiftUI


class WidgetShowDaysViewModel: ObservableObject {
    
    func getColorDayOfWeekString(today:String)->Color {
        switch today {
        case "Monday":
            return Color.red
        case "Tuesday":
            return Color.orange
        case "Wednesday":
            return Color.green
        case "Thursday":
            return Color.blue
        case "Friday":
            return Color.pink
        case "Saturday":
            return Color.yellow
        case "Sunday":
            return Color.gray
        default:
            print("Error fetching COLOR days")
            return Color.white
        }
    }
    
    func getDayOfWeekString(today:String)->String {
        let formatter  = DateFormatter()
        formatter.dateFormat = "E"
        if let todayDate = formatter.date(from: today) {
            let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
            let myComponents = myCalendar.components(.weekday, from: todayDate)
            let weekDay = myComponents.weekday
            switch weekDay {
            case 1:
                return "Sunday"
            case 2:
                return "Monday"
            case 3:
                return "Tuesday"
            case 4:
                return "Wednesday"
            case 5:
                return "Thursday"
            case 6:
                return "Friday"
            case 7:
                return "Saturday"
            default:
                print("Error fetching days")
                return "Day"
            }
        } else {
            return "false"
        }
    }
}
