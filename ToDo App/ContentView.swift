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
    
    var body: some View {
        NavigationView{
            VStack{
                 NavigationLink(destination: WelcomePage()){
                        Text("Go somewhere")
                    }
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
