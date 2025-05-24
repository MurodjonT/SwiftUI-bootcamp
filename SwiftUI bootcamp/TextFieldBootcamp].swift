//
//  TextFieldBootcamp].swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 24/05/25.
//

import SwiftUI




struct TextFieldBootcamp_: View {
    @State private var selectedSegment: Segment = .favorites

    var body: some View {
        VStack(spacing: 20) {
            CustomSegmentedControl(selectedSegment: $selectedSegment)

            Text("Choosen segmented control: \(selectedSegment.rawValue)")
                .font(.headline)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    TextFieldBootcamp_()
}


struct CustomSegmentedControl: View {
    
    @Binding var selectedSegment: Segment

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Segment.allCases, id: \.self) { segment in
                Text(segment.rawValue)
                    .frame(maxWidth: .infinity)
                    .fontWeight(.medium)
                    .padding(.vertical, 8)
                    .background(selectedSegment == segment ? Color.blue : Color.gray.opacity(0.1))
                    .foregroundColor(selectedSegment == segment ? .white : .black)
                    .cornerRadius(20)
                    .onTapGesture {
                        withAnimation {
                            selectedSegment = segment
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
        .padding(.horizontal, 0)
    }
}


enum Segment: String, CaseIterable {
    case favorites = "Favorites"
    case downloads = "Downloads"
}
