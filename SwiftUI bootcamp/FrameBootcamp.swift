
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
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "chevron.right")
                    .padding(.leading, 20)
            }
            .frame(maxWidth: .infinity, idealHeight: .infinity, alignment: .leading)
            .padding()
            .background(Color(.systemCyan))
            .cornerRadius(24)
            
        }
        .padding(.horizontal)
        .padding(.vertical, 24)
        .frame(maxWidth: .infinity, alignment: .top)
        .background(Color(.secondarySystemBackground))
        
        
        HStack {
            HStack{
                VStack(alignment: .leading, spacing: 4) {
                    Text("Бонусы готовы к выплате")
                        .lineLimit(1)
                        .font(.system(size: 12))
                    Text("10 400 000 cум / 150$")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "barcode.viewfinder")
                    .padding()
                    .font(.system(size: 28))
            }
            .frame(maxWidth: .infinity, idealHeight: .infinity, alignment: .leading)
            .padding()
            .background(Color(.systemCyan))
            .cornerRadius(24)
        }
        .frame(maxWidth: .infinity, idealHeight: .infinity, alignment: .leading)
        .padding(.horizontal)
        .border(Color.red)
        .background(Color(.secondarySystemBackground))

    }

}
#Preview {
    FrameBootcamp()
}
