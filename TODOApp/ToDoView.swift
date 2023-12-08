//
//  ToDoView.swift
//  TODOApp
//
//  Created by nika razmadze on 08.12.23.
//

import SwiftUI

struct ToDoView: View {
    
    //MARK: - Data
    @State var tasks: [Task] = [
        Task(task: "Create ToDo App", date: "8 Dec", isCompleted: true),
        Task(task: "Mobile App research", date: "4 Oct", isCompleted: false),
        Task(task: "Prepare WireFrame for Main Flow", date: "4 Oct", isCompleted: false),
        Task(task: "Prepare Screens", date: "4 Oct", isCompleted: false),
        Task(task: "Website Research", date: "5 oct", isCompleted: false),
        Task(task: "Prepare Wireframe for Main Flow", date: "5 Oct", isCompleted: false),
        Task(task: "Prepare Screens", date: "5 Oct", isCompleted: false)
    ]
    
    
    //MARK: - Body
    var body: some View {
        VStack {
            HStack {
                
                Text("You have \(pendingTaskCount) tasks to complete")
                    .font(.system(size: 25))
                    .bold()
                    .foregroundStyle(.white)
                    .padding()
                Spacer()
                
                Image(systemName: "\(completedTaskCount).circle")
                    .resizable()
                    .frame(width: 44, height: 45)
                    .foregroundStyle(.green)
            }
            
            Button("Complete All") {
                completeAllPendingTasks()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .foregroundColor(.white)
            .background(Color.purple)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
//              TODO: ცუდად ფარავს თასქებს და ვერ მოვიფიქრე რა ვუშველო, ScrollView ვცადე მთელ ვიუზე და გააქრო ლისთი
//            Text("Progress")
//                .font(.system(size: 22))
//                .bold()
//                .multilineTextAlignment(.leading)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding()
//            
//            ProgressView(value: Double(completedTaskCount), total: Double(tasks.count))
            
            List {
                
                Section(header:
                            Text("Completed Tasks")
                    .foregroundStyle(.white)
                    .font(.system(size: 22))
                    .bold()
                ) {
                    ForEach(tasks.filter { $0.isCompleted }) { task in
                        TaskView(task: task, moveTask: moveTask)
                    }
                }
                
                Section(header:
                            Text("Pending Tasks")
                    .foregroundStyle(.white)
                    .font(.system(size: 22))
                    .bold()
                ) {
                    ForEach(tasks.filter { !$0.isCompleted }) { task in
                        TaskView(task: task, moveTask: moveTask)
                    }
                }
                
            }
            .listStyle(PlainListStyle())
            
        }
        .frame(maxWidth: .infinity)
        .preferredColorScheme(.dark)
        
    }
    
    
    
    //MARK: - Computed Properties
    var completedTaskCount: Int {
        return tasks.filter { $0.isCompleted }.count
    }
    
    var pendingTaskCount: Int {
        return tasks.filter { !$0.isCompleted }.count
    }
    
    
    //MARK: - Private Methods
    private func moveTask(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            let movedTask = tasks.remove(at: index)
            tasks.append(movedTask)
        }
    }
    
    private func completeAllPendingTasks() {
        for index in tasks.indices {
            if !tasks[index].isCompleted {
                tasks[index].isCompleted = true
            }
        }
    }
}

#Preview {
    ToDoView()
}
