import Foundation
import SwiftUI


class WidgetShowDaysViewModel: ObservableObject {
    
    @Published var citations = [QuoteModel]()
    
    func getCurrentQuote(today: Date) -> QuoteModel {
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: today)

        return citations[dayOfWeek - 1]
    }

    func getColorDayOfWeekString(today: Date) -> Color {
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: today)
        switch dayOfWeek {
        case 1:
            return Color.gray
        case 2:
            return Color.red
        case 3:
            return Color.orange
        case 4:
            return Color.green
        case 5:
            return Color.blue
        case 6:
            return Color.pink
        case 7:
            return Color.yellow
        default:
            print("Error fetching COLOR days")
            return Color.white
        }
    }
    
    func getDayOfWeekString(today: Date) -> String {
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: today)
        switch dayOfWeek {
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
    }
}
