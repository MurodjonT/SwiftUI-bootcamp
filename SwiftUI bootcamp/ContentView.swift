
//
//  frameBootcamp.swift
//  SwiftUI Learning
//
//  Created by Murodjon Turobov on 01/05/25.
//

import SwiftUI

struct FrameBootcamp: View {
    var body: some View {
        HStack {
            HStack(spacing: 8) {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 64))
//                    .border(Color.gray)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Murodjon Turobov ")
                        .lineLimit(1)
                        .font(.system(size: 17))
                    Text("iOS Developer")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "chevron.right")
                    .padding(.leading, 20)
            }
            .frame(maxWidth: .infinity, idealHeight: .infinity, alignment: .leading)
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(24)
            
        }
        .padding(.horizontal)
        .padding(.vertical, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(.secondarySystemBackground))
        
    }
}
#Preview {
    FrameBootcamp()
}
