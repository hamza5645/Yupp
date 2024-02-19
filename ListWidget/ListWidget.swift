//
//  ListWidget.swift
//  ListWidget
//
//  Created by Hamza Osama on 2/13/24.
//

import WidgetKit
import SwiftUI
import SwiftData

struct Provider: TimelineProvider {
    @MainActor func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), tasks: getTasks())
    }

    @MainActor func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), tasks: getTasks())
        completion(entry)
    }

    @MainActor func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let timeline = Timeline(entries: [SimpleEntry(date: .now, tasks: getTasks())], policy: .after(.now.advanced(by: 60 * 5)))
        completion(timeline)
    }
    
    @MainActor
    private func getTasks() -> [Task] {
        guard let modelContainer = try? ModelContainer(for: Task.self) else {
            return []
        }
        let descriptor = FetchDescriptor<Task>(predicate: #Predicate { task in
            task.complete == false
        }, sortBy: [SortDescriptor(\Task.complete), SortDescriptor(\Task.priority, order: .reverse), SortDescriptor(\Task.date, order: .reverse)]
        )
        let Task = try? modelContainer.mainContext.fetch(descriptor)
        
        return Task ?? []
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let tasks: [Task]
    @State private var subCompleted = false
}

struct ListWidgetEntryView : View {
    var entry: Provider.Entry
    @State private var subCompleted = false

    var body: some View {
        VStack {
            HStack {
                Text("Tasks")
                    .fontWeight(.semibold)
                Spacer()
                Text("3") //Replace with task.count later
                    .bold()
            }
            Spacer()
            ForEach(entry.tasks.prefix(3)) { task in
                HStack {
                    VStack {
//                        Button(intent: CompleteTask(tasksTitle: task.title)) {
//                            Image(systemName: task.complete ? "circle.fill" : "circle")
//                        }
                        Image(systemName: "circle")
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    VStack {
                        HStack {
                            Text(task.title)
                                .font(.headline)
                                .fontWeight(.light)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct ListWidget: Widget {
    let kind: String = "ListWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                ListWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                ListWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
//        .supportedFamilies([.systemSmall])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

#Preview(as: .systemSmall) {
    ListWidget()
} timeline: {
    SimpleEntry(date: .now, tasks: [])
    SimpleEntry(date: .now, tasks: [])
}

//Sort Boolean
extension Bool: Comparable {
    public static func <(lhs: Self, rhs: Self) -> Bool {
        // the only true inequality is false < true
        !lhs && rhs
    }
}
