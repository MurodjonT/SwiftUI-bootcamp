//
//  BindingBootcamp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 12/05/25.
//

import SwiftUI

struct BindingBootcamp: View {
    
    @State private var count: Int = 0
    @State private var BackColor: Color = .blue
    
    var body: some View {
        VStack {
            Button("Change color") {
                if BackColor == .blue {
                    BackColor = .orange
                } else {
                    BackColor = .blue
                }
            }
          
            Text(count.description)
            HStack {
                Button("Increse") {
                    count += 1
                }
        
                Button("Decrese") {
                    count -= 1
                }
               

            }
            
            NewBindingView(sanoq: $count, rang: $BackColor)

        }
        .background(BackColor)
        .foregroundStyle(.white)
    }
    
   
    
}

struct NewBindingView: View {
    
    @Binding var sanoq: Int
    @Binding var rang: Color
    
    var body: some View {
        Button("Change color"){
            if rang == .blue {
                rang = .orange
            } else {
                rang = .blue
            }
        }
        HStack {
            Button("Increase") {
                sanoq += 1
                
            }
            
            Button("Decrese") {
                sanoq -= 1
            }
            
        }
        .foregroundStyle(.white)
    }
        
}

#Preview {
    BindingBootcamp()
}
