//
//  Animation.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 12/05/25.
//


import SwiftUI

struct AnimationBootcamp: View {
    @State private var isBig = false
    @State private var showBox = false


    var body: some View {
            VStack {
                Button("Change the shape of circle") {
                    isBig.toggle()
                }
                Circle()
                    .frame(width: isBig ? 100 : 0, height: isBig ? 100 : 0)
                    .foregroundColor(.blue)
                    .animation(.easeInOut(duration: 0.5), value: isBig)
                
                if showBox {
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 200, height: 200)
                        .transition(.slide)
                        .animation(.easeInOut, value: showBox)
                }
                
           


                Button("Create Square") {
                    withAnimation {
                        showBox.toggle()
                    }
                }
//                RotatingView()
//                ColorChangeBox()
//                OpacityExample()
//                LoadingDots()
                ScaleButton()
                RotateButton()
                HeartButton()
            }
        }
    }

struct RotatingView: View {
    @State private var rotated = false

    var body: some View {
        VStack {
            Image(systemName: "circle.hexagonpath.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(rotated ? 360 : 90))
                .animation(.linear(duration: 1), value: rotated)

            Button("Rotate") {
                rotated.toggle()
            }
        }
    }
}

struct ColorChangeBox: View {
    @State private var isRed = true

    var body: some View {
        Rectangle()
            .fill(isRed ? Color.red : Color.blue)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.5)) {
                    isRed.toggle()
                }
            }
    }
}


struct OpacityExample: View {
    @State private var isVisible = true

    var body: some View {
        VStack {
            if isVisible {
                Text("Hello!")
                    .font(.largeTitle)
                    .opacity(isVisible ? 1 : 0)
                    .transition(.opacity)
                    .animation(.easeInOut, value: isVisible)
            }

            Button("Toggle Text") {
                withAnimation {
                    isVisible.toggle()
                }
            }
        }
    }
}

struct LoadingDots: View {
    @State private var scale: CGFloat = 0.5

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { index in
                Circle()
                    .frame(width: 12, height: 12)
                    .scaleEffect(scale)
                    .animation(
                        Animation.easeInOut(duration: 0.6)
                            .repeatForever()
                            .delay(Double(index) * 0.2),
                        value: scale
                    )
            }
        }
        .onAppear {
            scale = 1.0
        }
    }
}



struct ScaleButton: View {
    @State private var isPressed = false

    var body: some View {
        Button(action: {
            isPressed.toggle()
        }) {
            Text("Scale Button")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .scaleEffect(isPressed ? 1.2 : 1.0)
                .animation(.easeInOut(duration: 0.2), value: isPressed)
        }
    }
}

struct RotateButton: View {
    @State private var angle = 0.0

    var body: some View {
        Button(action: {
            angle += 360
        }) {
            Image(systemName: "arrow.2.circlepath")
                .font(.largeTitle)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .clipShape(Circle())
                .rotationEffect(.degrees(angle))
                .animation(.spring(), value: angle)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct HeartButton: View {
    @State private var isLiked = false

    var body: some View {
        Button(action: {
            isLiked.toggle()
        }) {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .font(.largeTitle)
                .foregroundColor(isLiked ? .red : .gray)
                .scaleEffect(isLiked ? 2.3 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.4), value: isLiked)
        }
        .padding()
    }
}


#Preview {
    AnimationBootcamp()
}
