//
//  AppWidget.swift
//  AppWidget
//
//  Created by Rachel Ansley Park on 1/5/21.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), myString: "...")
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration, myString: "...")
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            // Change time from one hour to 10 seconds
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset * 10, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration, myString: MyDataProvider.getRandomString())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let myString: String
}

// Widget Look
struct AppWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            // Set background
            Color.black.edgesIgnoringSafeArea(.all)
            
            // Display text
            Text(entry.myString)
                .fontWeight(.heavy)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)

        }
    }
}

@main
struct AppWidget: Widget {
    let kind: String = "AppWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            AppWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct AppWidget_Previews: PreviewProvider {
    static var previews: some View {
        AppWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), myString: "Random String"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
