import SwiftUI

struct FrameBootcamp: View {
    var body: some View {
        NavigationStack() {
            ScrollView {
                HStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Бонусы готовы к выплате")
                                .lineLimit(1)
                                .font(.system(size: 12))
                            Text("10 400 000 cум / 150$")
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                        }
                        .padding(-5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "barcode.viewfinder")
                            .padding(0)
                            .frame(height: 74, alignment: .topTrailing)
                            .font(.system(size: 28))
                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.systemCyan))
                    .cornerRadius(24)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.vertical, 24)                .padding(.horizontal)
                .background(Color(.systemBackground))
                .navigationTitle("") // Bo‘sh qoldirib o‘zingiz title qilamiz
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack(spacing: 10) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 36, height: 36)
                                .foregroundColor(.blue)
                            
                            Text("Murodjon")
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    FrameBootcamp()
}
