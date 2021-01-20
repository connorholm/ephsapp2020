//
//  AppWidget.swift
//  AppWidget
//
//  Created by Rachel Ansley Park on 1/5/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), myString: "...")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), myString: "1st Hour")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            // Change time from one hour to 10 seconds
            let entryDate = Calendar.current.date(byAdding: .second, value: hourOffset * 10, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, myString: WidgetGetHour())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
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
                .font(.title)
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
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            AppWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("EPHS")
        .description("See the current class period.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct AppWidget_Previews: PreviewProvider {
    static var previews: some View {
        AppWidgetEntryView(entry: SimpleEntry(date: Date(), myString: "Random String"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
//test
func WidgetGetHour() -> String {
    let currentClassHour = getHour()
    var hr: String = ""
    if currentClassHour == 1{
        hr = "1st Hour"
    }else if currentClassHour == 2{
        hr = "2nd Hour"
    }else if currentClassHour == 3{
        hr = "3rd Hour"
    }else if currentClassHour == 4{
        hr = "4th Hour"
    }else if currentClassHour == -1{
        hr = "Class Hasn't Started Yet"
    }
    
    return hr
}
