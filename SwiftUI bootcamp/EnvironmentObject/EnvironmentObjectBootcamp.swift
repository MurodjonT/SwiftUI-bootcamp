//
//  EnvironmentObjectBootcamp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 03/06/25.
//
import Foundation
import SwiftUI

class CounterModel2: ObservableObject {
    
    @Published var count = 0
}

struct HomeView2: View {
    @EnvironmentObject var model: CounterModel2

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Home View")
                    .font(.title)

                Text("Count: \(model.count)")

                Button("Increase") {
                    model.count += 1
                }

                NavigationLink("Go to Detail View") {
                    DetailView3()
                }
            }
            .padding()
        }
    }
}


struct DetailView3: View {
    @EnvironmentObject var model: CounterModel2

    var body: some View {
        VStack(spacing: 20) {
            Text("Detail View")
                .font(.title)

            Text("Count: \(model.count)")

            Button("Decrease") {
                model.count -= 1
            }
        }
        .padding()
    }
}


#Preview {
    let model = CounterModel2()
    return HomeView2()
        .environmentObject(model)
}

