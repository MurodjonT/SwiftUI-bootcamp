//
//  EnvironmentObjectBootcamp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 03/06/25.
//
import Foundation
import SwiftUI

class CounterModel1: ObservableObject {
    @Published var count: Int = 0
}


struct HomeView2: View {
    @EnvironmentObject var model: CounterModel1
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Count: \(model.count)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Button("Increment") {
                    model.count += 1
                }
                .padding(4)
                NavigationLink("Go to Detail View") {
                    DetailView3()
                    
                }
            }
            
            
        }
    }
}


struct DetailView3: View {
    @EnvironmentObject var model: CounterModel1
    
    var body: some View {
        VStack {
            Text("Detail View")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Count: \(model.count)")
                .font(.title)
            Button("Decrement") {
                model.count -= 1
                
            }
            .padding(4)
            NavigationLink("Go to Home View"){
                HomeView2()
            }
        }
    }
}
#Preview {
    HomeView2()
        .environmentObject(CounterModel1())
}
