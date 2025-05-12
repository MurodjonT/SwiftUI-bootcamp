//
//  BindingBootcamp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 12/05/25.
//

import SwiftUI

struct BindingBootcamp: View {
    
    @State private var count: Int = 0
    var body: some View {
        VStack {
            Text(count.description)
            HStack {
                Button("Increse the value") {
                    count += 1
                }
                Button("Decrese the value") {
                    count -= 1
                }
            }
            NewBindingView(sanoq: $count)
        }
    }
}




struct NewBindingView: View {
    
    @Binding var sanoq: Int
    
    var body: some View {
        HStack {
            Button("Increase") {
                sanoq += 1
                
            }
            
            Button("Decrese") {
                sanoq -= 1
            }
        }
    }
}

#Preview {
    BindingBootcamp()
}
