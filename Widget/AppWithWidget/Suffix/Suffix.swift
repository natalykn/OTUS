//
//  Suffix.swift
//  Suffix
//
//  Created by Natalia Andryushina on 2022-03-28.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: TimelineProvider {
    @AppStorage("top3", store: UserDefaults(suiteName: "group.com.natalykn.ShareExtension"))
    var top3Data: Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), top3: [])
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        guard let top3 = try? JSONDecoder().decode(Array<String>.self, from: top3Data) else { return }
        let entry = SimpleEntry(date: Date(), top3: top3)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        guard let top3 = try? JSONDecoder().decode(Array<String>.self, from: top3Data) else { return }
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, top3: top3)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let top3: Array<String>
}

struct SuffixEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        MainWidgetView(top3: entry.top3)
    }
}

@main
struct Suffix: Widget {
    let kind: String = "Suffix"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SuffixEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Suffix_Previews: PreviewProvider {
    static var previews: some View {
        SuffixEntryView(entry: SimpleEntry(date: Date(), top3: []))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
