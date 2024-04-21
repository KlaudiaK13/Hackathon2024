import SwiftUI

struct SugView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    // Blue background
                    Color(red: 173/255, green: 216/255, blue: 230/255)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        
                        // White box with text
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 300, height: 300)
                            .cornerRadius(10)
                            .overlay(
                                Text("Hello, I am Klaudia Kubik. Please contact me if you have any suggestions! My contact is KlaudiaKubik2007@gmail.com")
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .padding()
                            )
                            .padding()
                        
                        Spacer()
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                                        Button(action: {
                    // Handle back button action here
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                )
            }
            
        }
    }
    
    struct SugView_Previews: PreviewProvider {
        static var previews: some View {
            SugView()
        }
    }
}
