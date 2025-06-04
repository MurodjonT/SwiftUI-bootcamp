//
//  CounterModel.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 03/06/25.
//

import Foundation
import Combine
import SwiftUI

class CounterModel: ObservableObject {
    @Published var count = 0
}



struct HomeView: View {
    @ObservedObject var model: CounterModel

    
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
                    DetailView2(model: model)
                }
            }
            .padding()
        }
    }
}



struct DetailView2: View {
    @ObservedObject var model: CounterModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Detail View")
                .font(.title)

            Text("Count: \(model.count)")

            Button("➖ Decrease") {
                model.count -= 1
            }
        }
        .padding()
    }
}


#Preview {
    HomeView(model: CounterModel())
}
