//
//  ContentView.swift
//  ToDo App
//
//  Created by Bodigam,Jeevan on 4/5/21.
//  Copyright © 2021 Bodigam,Jeevan. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var userName:String=""
    var body: some View {
        NavigationView{
            VStack{
                RectangleImage().padding()
                Spacer()
            TextField("Enter Name",text:$userName)
                    .padding(.horizontal,30)
                NavigationLink(destination: WelcomePage(userName:self.$userName)){
                    Text("Track Expenses")
                        .frame(width: .infinity, height: 50.0)
                        .background(Color.green)
                        .cornerRadius(10)
                        .foregroundColor(Color.black)
                        .font(.title)
                    }
                Spacer()

            }
        }
        
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
