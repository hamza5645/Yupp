//
//  EditView.swift
//  Yupp
//
//  Created by Hamza Osama on 13/11/2023.
//

import SwiftUI
import SwiftData

struct EditView: View {
    @Bindable var task: Task
    
    var body: some View {
        VStack {
            HStack {
                TextField("Title",text: $task.title)
                    .font(.system(size: 34))
                    .padding()
            }
            HStack {
                //                Text(task.date.formatted(date: .numeric, time: .shortened))
                //                    .padding(.leading)
                DatePicker("Date", selection: $task.date)
                    .padding(.leading)
                Spacer()
            }
            
            TextField("description", text: $task.discription, axis: .vertical)
                .padding()
            
            ZStack {
                Rectangle()
                    .foregroundStyle(yellowCustom)
                    .cornerRadius(5)
                VStack {
                    HStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .padding([.leading, .top], 10)
                        
                        TextField("sub", text: $task.sub)
                            .foregroundColor(task.sub.isEmpty ? Color.white : Color.black)
                            .foregroundStyle(.black)
                            .bold()
                            .padding([.trailing, .top], 10)
                        
                        
                        Spacer()
                    }
                    
                    ZStack {
                        Rectangle()
                            .frame(width: 300, height: 20)
                            .cornerRadius(30)
                        
                        Rectangle()
                            .frame(width: 200, height: 20)
                            .cornerRadius(30)
                            .foregroundStyle(.black)
                            .padding(.trailing, 100)
                    }
                    Spacer()
                }
            }
            .frame(height: 80)
            .padding([.trailing, .leading])
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
