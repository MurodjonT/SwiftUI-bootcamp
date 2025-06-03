////
////  ButtonBootcamp.swift
////  SwiftUI bootcamp
////
////  Created by Murodjon Turobov on 10/05/25.
////
//
//import SwiftUI
//
//struct ButtonBootcamp: View {
//    
//    @State var title = "Hello, World!"
//    @State private var isLiked = false
//    @State private var loading = false
//    @State private var isPressed = false
//
//    
//    var body: some View {
//        
//        VStack(spacing: 20) {
//            
//
//            LoadingButton(text: "Yuborish", isLoading: $loading) {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    loading = false
//                }
//            }
//
//            IconLeftButton(
//                        text: "Left Icon",
//                        iconName: "hand.thumbsup.fill",
//                        backgroundColor: .blue
//                    ) {
//                        isPressed = true
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                            isPressed = false
//                        }
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                    .modifier(PressedAnimation(isPressed: $isPressed))
//            
//                   IconRightButton(
//                       text: "Right Icon",
//                       iconName: "square.and.arrow.up",
//                       backgroundColor: .pink
//                   ) {
//                       print("Share tugmasi bosildi")
//                   }
//            
//            NeumorphicButton(text: "Neumorphic Button") {
//                print("NeumorphicButton")
//            }
//               }
//               .padding()
//        
//        
//        VStack(spacing: 20) {
//            
//            Text(title)
//            
//            IconLeftButton(text: "Right Masara", iconName: "person", backgroundColor: Color.blue) {
//                self.title = "Masarara button was pressed"
//                
//                
//            }
//            
//            
//            
//            Button("Press me!") {
//                if title != "Button was Presssed" {
//                    self.title = "Button was Presssed"
//                } else {
//                    self.title = "Hello, World!"
//                }
//            }
//            
//            
//            
//            Button(action: {
//                print("Like tugmasi bosildi")
//            }) {
//                HStack {
//                    Image(systemName: "hand.thumbsup.fill")
//                    Text("Like")
//                }
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .clipShape(.rect(cornerRadius: 18))
//                .shadow(radius: 5)
//            }
//            
//            Button(action: {
//                isLiked.toggle()
//            }) {
//                Image(systemName: isLiked ? "heart.fill" : "heart")
//                    .foregroundColor(isLiked ? .red : .gray)
//                    .font(.largeTitle)
////                    .animation(.smooth)
//            }
//            
//            Button("Saqlash") {
//                
//            }
//            .buttonStyle(.borderedProminent)
//            .tint(Color.secondary)
//            
//            MainButton("Main") {
//
//                
//            }
//            .padding()
//            
////            .disabled(true)
//            
//            
//            Button("Saqlash main", systemImage: "person") {
//                
//            }
//            .buttonStyle(.main)
//            .padding()
////            .disabled(true)
//        }
//        
//        Button("Saqlash Large", systemImage: "person") {
//            
//        }
//        .buttonStyle(.large)
//        .padding()
////            .disabled(true)
//    }
//        
//      
//    }
//    //
//    
//    
//    
//    struct MainButton: View {
//        var titleKey: LocalizedStringKey
//        var action: () -> Void
//    
//        init(_ titleKey: LocalizedStringKey, action: @escaping () -> Void) {
//            self.titleKey = titleKey
//            self.action = action
//        }
//    
//        var body: some View {
//            Button(action: action) {
//                Text(titleKey)
//                    .font(.system(size: 16, weight: .semibold))
//                    .padding()
//                    .foregroundStyle(Color.white)
//                    .buttonStyle(.borderedProminent)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .clipShape(.rect(cornerRadius: 4))
//    
//            }
//        }
//    }
//    
//    struct MainButton2: View {
//        var titleKey: LocalizedStringKey
//        var action: () -> Void
//    
//        init(_ titleKey: LocalizedStringKey, action: @escaping () -> Void) {
//            self.titleKey = titleKey
//            self.action = action
//        }
//    
//        var body: some View {
//            Button(action: action) {
//                Text(titleKey)
//                    .font(.system(size: 16, weight: .semibold))
//                    .padding()
//                    .foregroundStyle(Color.white)
//                    .buttonStyle(.borderedProminent)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.blue)
//                    .clipShape(.rect(cornerRadius: 4))
//    
//            }
//        }
//    }
//    
//
//
//
//
//
//
//struct IconLeftButton: View {
//    let text: String
//    let iconName: String
//    let backgroundColor: Color
//    let action: () -> Void
//
//    var body: some View {
//        Button(action: action) {
//            HStack {
//                Image(systemName: iconName)
//                Text(text)
//            }
//            .padding()
//            .background(backgroundColor)
//            .foregroundColor(.white)
//            .clipShape(.rect(cornerRadius: 18))
//        }
//    }
//}
//
//struct IconRightButton: View {
//    let text: String
//    let iconName: String
//    let backgroundColor: Color
//    let action: () -> Void
//
//    var body: some View {
//        Button(action: action) {
//            HStack {
//                Text(text)
//                Image(systemName: iconName)
//            }
//            .padding()
//            .background(backgroundColor)
//            .foregroundColor(.white)
//            .clipShape(.rect(cornerRadius: 18))
//        }
//    }
//}
//
//
//struct NeumorphicButton: View {
//    var text: String
//    var action: () -> Void
//
//    var body: some View {
//        Button(action: action) {
//            Text(text)
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(Color(.systemGray6))
//                .clipShape(.rect(cornerRadius: 18))
//                .shadow(color: .white, radius: 6, x: -5, y: -5)
//                .shadow(color: .gray.opacity(0.4), radius: 6, x: 5, y: 5)
//        }
//    }
//}
//
//struct LoadingButton: View {
//    let text: String
//    @Binding var isLoading: Bool
//    let action: () -> Void
//
//    var body: some View {
//        Button(action: {
//            isLoading = true
//            action()
//        }) {
//            if isLoading {
//                ProgressView()
//                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
//                    .padding()
//                    .frame(maxWidth: .infinity)
//            } else {
//                Text(text)
//                    .padding()
//                    .frame(maxWidth: .infinity)
//            }
//        }
//        .background(isLoading ? Color.gray : Color.blue)
//        .foregroundColor(.white)
//        .clipShape(.rect(cornerRadius: 18))
//        .padding([.leading, .trailing], 40)
//    }
//}
//
//
//dasqwedqwe
//struct PressedAnimation: ViewModifier {
//    @Binding var isPressed: Bool
//
//    func body(content: Content) -> some View {
//        content
//            .scaleEffect(isPressed ? 0.8 : 1.0 )
//            .animation(.easeInOut(duration: 0.15), value: isPressed)
//    }
//}
//
//struct LargeButtonStyle: ButtonStyle {
//
//    @Environment(\.isEnabled) var isEnabled
//     func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .font(.system(size: 18, weight: .semibold  ))
//            .padding()
//            .foregroundStyle(isEnabled ? (configuration.role == .destructive ? Color.red : Color.white) : Color(.tertiaryLabel))
//            .frame(maxWidth: .infinity)
//            .background{
//                Group {
//                    if isEnabled {
//                        if configuration.isPressed {
//                            RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6))
//                        } else {
//                            RoundedRectangle(cornerRadius: 12).fill(Color(.blue))
//                        }
//                    } else {
//                        RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6))
//                    }
//                }
//            }
//            .scaleEffect(configuration.isPressed ? 0.95 : 1)
//            .animation(.bouncy, value: configuration.isPressed)
//
//   }
//
//}
//
//struct MainButtonStyle: ButtonStyle {
//
//    @Environment(\.isEnabled) var isEnabled
//     func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .font(.system(size: 18, weight: .semibold  ))
//            .padding()
//            .foregroundStyle(isEnabled ? (configuration.role == .destructive ? Color.red : Color.white) : Color(.tertiaryLabel))
//            .frame(maxWidth: .infinity)
//            .background{
//                if isEnabled {
//                    if configuration.isPressed {
//                        RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6))
//                    } else {
//                        RoundedRectangle(cornerRadius: 12).fill(Color(.blue))
//                    }
//                } else {
//                    RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6))
//                }
//            }
//   }
//
//}
//
//extension ButtonStyle where Self == MainButtonStyle {
//    static var main: Self { MainButtonStyle() }
//    }
//
//extension ButtonStyle where Self == LargeButtonStyle {
//    static var large: Self { LargeButtonStyle() }
//    }
//
//
//#Preview {
//    ButtonBootcamp()
//}
//
