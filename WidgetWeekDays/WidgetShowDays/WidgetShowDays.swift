//
//  WidgetShowDays.swift
//  WidgetShowDays
//
//  Created by Amelie Pocchiolo on 22/11/2023.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct WidgetShowDaysEntryView : View {
    var entry: Provider.Entry
    @ObservedObject var viewModel = WidgetShowDaysViewModel()

    var body: some View {
        let currentDay = entry.date.formatted(.dateTime.weekday(.wide))
        let dayWeek = viewModel.getDayOfWeekString(today: currentDay)
        let colorDay = viewModel.getColorDayOfWeekString(today: dayWeek)
        ZStack {
            colorDay
                .ignoresSafeArea()
            Text(dayWeek)
                .foregroundColor(.black)
        }
    }
}

struct WidgetShowDays: Widget {
    let kind: String = "WidgetShowDays"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WidgetShowDaysEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WidgetShowDays_Previews: PreviewProvider {
    static var previews: some View {
        WidgetShowDaysEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
