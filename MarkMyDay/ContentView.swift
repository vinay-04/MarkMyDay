//
//  ContentView.swift
//  MarkMyDay
//
//  Created by Vinay Rajan S on 04/05/24.
//

import SwiftUI


struct ContentView: View {
    
    @State var tasks = [
        Task(id: "Music", status: false),
    ]
    
    @State var task: String = "";
    
    func addTask(task: String){
        if(task != ""){
            tasks.append(Task(id: task, status: false))}
    }
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            Text("Mark My Day")
                .font(.title).fontWeight(.ultraLight)
                
            Divider()
            
            ScrollView(){
                ForEach($tasks){$task in
                    Toggle(task.id, isOn: $task.status)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            
            Divider()
            
            TextField("Add Task", text: $task)
                .textFieldStyle(.roundedBorder)
                .frame(width: 200)
                .opacity(0.4)
        
            HStack() {
                Button("Add Task", action: {
                    addTask(task: task)
                })
                .opacity(0.4)
                
                Spacer()
                    .frame(maxWidth: 80)
                
                Button("Clear", action: {
                    tasks.removeAll()
                })
                .textFieldStyle(.roundedBorder)
                .background(Color(.red))
                .opacity(0.2)
            }
        }
        .frame(maxWidth: 200, maxHeight: 320)
        .padding()
    }
}


struct Task: Identifiable{
    var id: String,
    status: Bool
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
