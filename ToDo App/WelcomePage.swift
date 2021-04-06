//
//  WelcomePage.swift
//  ToDo App
//
//  Created by Bodigam,Jeevan on 4/5/21.
//  Copyright © 2021 Bodigam,Jeevan. All rights reserved.
//

import SwiftUI
import Combine

struct WelcomePage: View {
    @ObservedObject var taskStore=TaskStore()
    @State var expenseName:String=""
    @State var expenseValue:String=""
    @State var expenseTotal:Double=0
    @State var disableButton:Bool=false
    @State var alertShow:Bool=false
    @Binding var userName:String;
    
    var formattedValue:String{
        return String(format: "%.2f",arguments:[expenseTotal])
    }
    var guestuser:String{
        if userName.isEmpty{
            return "Guest"
        }else{
            return userName
        }
    }
    
    var inputView:some View{
        VStack(spacing:10){
            Text("$ \(formattedValue)")
                .font(.title)
                .foregroundColor(Color.red)
                .bold()
            TextField("Description*",text: self.$expenseName).keyboardType(.default)
            HStack{
                TextField("$10(Required)",text: self.$expenseValue).keyboardType(.numberPad)
//                NavigationLink(destination: ){
                    Button(action:(self.addNewToDo)){
                        Text("Add Expense")
                    }
                .disabled(self.disableButton)
                .frame(width: 100.0, height: 50.0)
                .background(Color.orange)
                .foregroundColor(Color.black)
                .cornerRadius(20)
                .font(.system(size:15))

            }
            
        }
    }
    
    
    func addNewToDo(){
        if !self.expenseName.isEmpty && !self.expenseValue.isEmpty{
            disableButton=false
            taskStore.tasks.append(Task(expense: self.expenseValue, toDoItem: self.expenseName))
            expenseTotal+=Double((Double)(self.expenseValue) ?? 0)
            self.expenseValue=""
            self.expenseName=""
//            self.disableButton=true
        }else{
            self.alertShow=true
        }
    }
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    inputView.padding()
                    List{
                        ForEach(self.taskStore.tasks){
                            task in
                            HStack{
                                Text(task.toDoItem)
                                    Spacer()
                                Text("$\(task.expense)")
                            }
                        }
                        
                    }
                }.navigationBarTitle("\(guestuser)'s Expenses ")
                .padding()
                    .alert(isPresented: $alertShow){
                        Alert(title: Text("OOPS"), message:Text("Mandatory fields missing!!!") , dismissButton: .default(Text("Got it")))
                }
                
            }
        }
        
    }
}

//struct WelcomePage_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomePage( userName: "Jeevan")
//    }
//}
