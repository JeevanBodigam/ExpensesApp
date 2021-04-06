//
//  RectangleImage.swift
//  ToDo App
//
//  Created by sai kiran reddy on 06/04/21.
//  Copyright © 2021 Bodigam,Jeevan. All rights reserved.
//

import Foundation
import SwiftUI

struct RectangleImage: View {
    var body: some View{
        Image("bearcat")
                    .resizable()
                    .clipShape(Rectangle())
                    .aspectRatio(contentMode: .fit)
            .frame(height: nil)
            .cornerRadius(20)
                    .padding(.all)
    }
}

struct RectangleImage_Previews: PreviewProvider {
    static var previews: some View{
        RectangleImage()
    }
    
}

