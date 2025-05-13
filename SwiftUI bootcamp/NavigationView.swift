//
//  NavigationView.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 13/05/25.
//

import SwiftUI

struct NavigationBootcamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink("Go To My Screen", destination: MyOtherScreen())
            }
            .navigationTitle("Price")
            .navigationBarTitleDisplayMode(.inline)

        }
        
    }
}

struct MyOtherScreen: View {
    var body: some View {
        ZStack {

                Color.green.ignoresSafeArea(edges: .all)
                .navigationTitle("Green Screne")
            
            .navigationTitle("My Screen")
//            .navigationBarTitleDisplayMode(.inline)

        }
        
    }
    
}




//struct MenuView: View {
//    var body: some View {
//        NavigationView {
//            VStack(spacing: 20) {
//                NavigationLink(destination: DetailView()) {
//                    Text("Go to Details")
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//            }
//            .navigationTitle("Menu")
//        }
//    }
//}
//
//struct DetailView: View {
//    var body: some View {
//        Text("This is the detail page.")
//            .navigationTitle("Details")
//    }
//}






struct CategoryListView: View {
    let categories = ["Swift", "Python", "Rust", "Kotlin"]

    var body: some View {
        NavigationView {
            List(categories, id: \.self) { category in
                NavigationLink(destination: CategoryDetailView(name: category)) {
                    Text(category)
                }
            }
            .navigationTitle("Languages")
        }
    }
}

struct CategoryDetailView: View {
    let name: String

    var body: some View {
        Text("You selected: \(name)")
            .navigationTitle(name)
    }
}



struct Item: Hashable, Identifiable {
    var id = UUID()
    var name: String
}

struct StackNavigationView: View {
    @State private var path = NavigationPath()

    let items = [
        Item(name: "Swift"),
        Item(name: "Python"),
        Item(name: "Rust")
    ]

    var body: some View {
        NavigationStack(path: $path) {
            List(items) { item in
                Button(action: {
                    path.append(item)
                }) {
                    Text(item.name)
                }
            }
            .navigationTitle("Languages")
            .navigationDestination(for: Item.self) { selectedItem in
                DetailView(item: selectedItem)
            }
        }
    }
}


struct DetailView: View {
    let item: Item

    var body: some View {
        VStack(spacing: 20) {
            Text("You selected:")
                .font(.headline)
            Text(item.name)
                .font(.largeTitle)
        }
        .navigationTitle(item.name)
    }
}

#Preview {
    StackNavigationView()
}



#Preview {
    CategoryListView()
}


//#Preview {
//    MenuView()
//}

#Preview {
    NavigationBootcamp()
}
