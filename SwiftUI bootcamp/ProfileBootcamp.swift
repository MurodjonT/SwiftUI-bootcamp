//
//  ProfileBootcamp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 05/05/25.
//
import SwiftUI

struct SettingsView: View {
    
    @State private var isOn = true

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Sozlamalar")
                .font(.system(size: 24, weight: .semibold))
                .padding([.top, .bottom], 4)
                .padding(.horizontal)

                ScrollView {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                            
                                VStack(alignment: .leading) {
                                    Text("Murodjon Turobov")
                                        .font(.system(size: 18, weight: .semibold))
                                    Text("Mijoz")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 0)
                            VStack(alignment: .leading, spacing: 8){
                                
                                Text("Asosiy")
                                    .font(.system(size: 18, weight: .semibold))
                                    .padding(.bottom, 8)
                                    .padding(.top, 24)
                                
                                HStack {
                                    Image("Bell_light")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                
                                    VStack(alignment: .leading) {
                                        Text("Bildirishnoma")
                                            .font(.system(size: 18))
                                    }
                                    
                                    Spacer()
                                    Toggle("", isOn: $isOn)
    //                                        .toggleStyle(SwitchToggleStyle(tint: Color.purple))
    //                                        .labelsHidden()
                                            .tint(Color.purple)
                      
                                }
                                .padding()
                                .background(Color.white)
                                .clipShape(.rect(cornerRadius: 12))
                                .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 0)

                            }
                            
                            HStack {
                                Image("User_alt_light")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                            
                                VStack(alignment: .leading) {
                                    Text("Mutaxassis bo'lib kirish")
                                }
                                
                                Spacer()
                                
                        
                            }
                            .padding()
                            .background(Color.white)
                            .clipShape(.rect(cornerRadius: 12))
                            .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 0)
                            
                            
                        }
                        
                        
                        .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
                    
            }
              
                .background(Color(.systemGray6))
//
//            List {
//                Section {
//                    Toggle("Bildirishnoma", systemImage: "bell.fill", isOn: $isOn)
//                } header: {
//                    Text("Asosiy")
//                        .font(.system(size: 18, weight: .semibold))
//                        .textCase(.none)
//                        .padding(.horizontal, -20)
//
//                }
//                .foregroundStyle(Color.primary)
//                .tint(Color.purple)
//            }
        }
    }
}

#Preview {
    SettingsView()
}
     struct RedBorderToggleStyle: ToggleStyle {
         func makeBody(configuration: Configuration) -> some View {
             Toggle(configuration)
                 .padding()
                 .border(.red)
        }
     }
