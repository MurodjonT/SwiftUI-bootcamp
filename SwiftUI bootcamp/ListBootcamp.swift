//
//  ListBootcamp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 21/05/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phoneNumber: String = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // MARK: - Profile Image
                    ZStack(alignment: .bottomTrailing) {
                        Image(systemName: "person.circle") // asset nomi
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            
                    
                        Button {
                            // Rasmni tahrirlash funksiyasi
                        } label: {
                            Image(systemName: "pencil")
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                                .padding(6)
                                .background(Circle().fill(Color.blue))
                        }
                    }
                    .padding(.top, 20)

                    // MARK: - Input Fields
                    VStack(spacing: 16) {
                        List {
                            profileTextField(label: "Ism", text: $firstName)
                            profileTextField(label: "Familiya", text: $lastName)
                            profileTextField(label: "Telefon raqami", text: $phoneNumber)
                            
                        }
                    }
                    .padding(.horizontal)

                    // MARK: - Delete Profile Button
                    Button {
                        // Profilni o‘chirish funksiyasi
                    } label: {
                        Text("Profilni o‘chirish")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: .gray.opacity(0.1), radius: 4, x: 0, y: 2)
                    }
                    .padding(.horizontal)

                    // MARK: - Save Button
                    Button {
                        // Saqlash funksiyasi
                    } label: {
                        Text("Saqlash")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray5))
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                    .disabled(false)
                }
            }
            .navigationTitle("Profil")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Orqaga qaytish
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
            .background(Color(.systemGray6).ignoresSafeArea())
        }
    }

    // MARK: - TextField Custom View
    private func profileTextField(label: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.gray)

            TextField(label, text: text)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray.opacity(0.1), radius: 4, x: 0, y: 2)
        }
    }
}

#Preview {
    ProfileView()
}
