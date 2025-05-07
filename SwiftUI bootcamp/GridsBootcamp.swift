//
//  GridsBootcamp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 07/05/25.
//

import SwiftUI

struct GridsLayout: View {
    
    var body: some View {
        GridFlexible()
        FixedFGrid()
        AdaptiveGrid()
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
        GridItem(.adaptive(minimum: 150))
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

