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
                  HStack {
                     Text("Sozlamalar")
                         .font(.system(size: 24, weight: .semibold))
                     Spacer()
                 }
                 .padding(.top, 4)
                 .padding(.bottom, 4)
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

                            Text("Asosiy")
                                .font(.system(size: 18, weight: .semibold))
                                .padding(.bottom, 8)
                                .padding(.top, 24)

                            HStack {
                                Image(systemName: "bell.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                            
                                VStack(alignment: .leading) {
                                    Text("Bildirishnoma")
                                        .font(.system(size: 18))
                                }
                                
                                Spacer()
                                Toggle("", isOn: $isOn)
                                        .toggleStyle(SwitchToggleStyle(tint: Color.purple))
                                        .labelsHidden()
                  
                            }
                            .padding(EdgeInsets(top: 16.5, leading: 19, bottom: 16.5, trailing: 16))
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 0)
                            
                            Spacer()
                            
                            HStack {
                                Image(systemName: "person.fill.checkmark.rtl")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                            
                                VStack(alignment: .leading) {
                                    Text("Mutaxassis bo'lib kirish")
                                        .font(.system(size: 18))
                                }
                                
                                Spacer()
                                
                        
                            }
                            .padding(EdgeInsets(top: 16.5, leading: 16, bottom: 16.5, trailing: 16))
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 0)
                            
                            
                        }
                        
                        
                        .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
                    
            }
                .background(Color(.systemGray6))
            
            List {
                Section {
                    Toggle("Bildirishnoma", systemImage: "bell.fill", isOn: $isOn)
                } header: {
                    Text("Asosiy")
                        .font(.system(size: 18, weight: .semibold))
                        .textCase(.none)
                        .padding(.horizontal, -20)

                }
                .foregroundStyle(Color.primary)
                .tint(Color.purple)
            }
        }
    }
}

#Preview {
    SettingsView()
}
