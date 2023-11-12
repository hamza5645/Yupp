//
//  ContentView.swift
//  Yupp
//
//  Created by Hamza Osama on 12/11/2023.
//

import SwiftUI
import SwiftData

// Custom Yellow
let yellowCustom = Color(red: 1, green: 0.811, blue: 0, opacity: 1.0)

struct ContentView: View {
    var body: some View {
        VStack {
            //Title and Bar
            HStack {
                Text("Personal")
                    .font(.system(size: 34))
                    .padding()
                
                Spacer()
                //Dot View
                DotView(color: .primary, hasTrailingPadding: false)
                DotView(color: .secondary, hasTrailingPadding: false)
                DotView(color: .secondary, hasTrailingPadding: false)
                DotView(color: .secondary, hasTrailingPadding: true)
                
            }
            .padding(.bottom)
            
            VStack {
                //Task View
                TaskView(title: "Swipe Right (Done)")
                TaskView(title: "Swipe Left (Delete)")
                TaskView(title: "Swipe Down (Add)")
            }
            Spacer()
        }
    }
}

//Dot View Structure
struct DotView: View {
    var color: Color
    var hasTrailingPadding: Bool
    
    var body: some View {
        Circle()
            .frame(width: 10, height: 10)
            .foregroundStyle(color)
            .padding([.top, .bottom], 20)
            .padding(.trailing, hasTrailingPadding ? 20 : 0)
    }
}

//Single Task Structure
struct TaskView: View {
    var title: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 60)
                .foregroundStyle(yellowCustom)
                .cornerRadius(5)
                .padding([.trailing, .leading])
            Text(title)
                .font(.system(size: 30))
                .foregroundStyle(.black)
        }
    }
}


#Preview {
    ContentView()
}
