//
//  TaskView.swift
//  TODOApp
//
//  Created by nika razmadze on 08.12.23.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let task: String
    let date: String
    var isCompleted: Bool
}

struct TaskView: View {
    
    @State var task: Task
    var moveTask: (Task) -> Void
    
    var body: some View {
        HStack{
            Rectangle()
                .fill(randomColor())
                .frame(width: 15)
            
            VStack(alignment: .leading){
                
                Text(task.task)
                    .foregroundStyle(.white)
                    
                
                HStack{
                    Image(systemName: "calendar")
                        .foregroundStyle(.white)
                    
                    Text(task.date)
                        .foregroundStyle(.white)
                }
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                moveTask(task)
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .purple : .purple)
                    .imageScale(.large)
            }
            .padding()
        }
        .background(Color(red: 0.24, green: 0.24, blue: 0.24, opacity: 1))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func randomColor() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        
        return Color(red: red, green: green, blue: blue)
    }
}

#Preview {
    TaskView(task: Task(task: "Create ToDo App", date: "8 Dec", isCompleted: false), moveTask: { _ in })
}
