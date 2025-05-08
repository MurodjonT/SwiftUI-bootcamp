//
//  GridsBootcamp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 07/05/25.
//

import SwiftUI

struct GridsLayout: View {
    
    var body: some View {
        ScrollView{
            GridFlexible()
            FixedFGrid()
            ProductGridView()
        }
        .background(Color(.systemGray6))

    }
}

#Preview {
    GridsLayout()
}

struct GridFlexible: View {
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, content: {
                
                ForEach(0..<4) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.random())
                        .frame(height: 100)
                        .overlay(Text("Item \(index)").foregroundStyle(.white))
                }
            })
            .padding()
        }
    }
}

struct FixedFGrid: View {
    
    let rows = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(0..<20) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.random())
                            .frame(width: 100)
                            .overlay(Text("Item \(index)").foregroundStyle(Color.white))
                    }
                }
            }
            .padding()
            
        }
    }
}


struct AdaptiveGrid: View {
    
    let gridItem = [
        GridItem(.adaptive(minimum: 200))
    ]
                 
    var body: some View {
                      VStack {
                          ScrollView{
                              LazyVGrid(columns: gridItem, spacing: 20) {
                                  ForEach(0..<20) { index in
                                      RoundedRectangle(cornerRadius: 10)
                                          .fill(Color.blue)
                                          .frame(height: 100)
                                          .overlay(Text("Item \(index)").foregroundStyle(Color.white))
                                  }
                              }
                          }
        }
                      .padding()
    }
}

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let price: String
}

let sampleProducts = [
    Product(name: "T-shirt", imageName: "shirt", price: "$19.99"),
    Product(name: "Boots", imageName: "boots1", price: "$49.99"),
    Product(name: "Hat", imageName: "hat", price: "$14.99"),
    Product(name: "Scarf", imageName: "scarf", price: "$14.99")
]

struct ProductGridView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(sampleProducts) { product in
                    HStack {
                        VStack(alignment: .center, spacing: 8) {            //question nega sidelarda padding turopti
                            Image(product.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 100)
                            HStack(spacing: 45) {
                                Text(product.name)
                                    .foregroundStyle(.primary)
                                    .font(.headline)
                                Text(product.price)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                               
                            }
                            Image(systemName: "cart")
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity, alignment: .center)
//                                .border(Color.blue, width: 1)

                            
                        }
                        .padding(0)
//                        .border(Color.red, width: 1)
                    }
                    .padding(20)
                    .background(Color.white)
                    .clipShape(.rect(cornerRadius: 12))
                    .shadow(radius: 2)
                }
            }
            .padding()
        }
    }
}



