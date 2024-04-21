import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 173/255, green: 216/255, blue: 230/255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("Food")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                        .foregroundColor(.white)
                    //
                   
                    
                    NavigationLink(destination: ButtonView()) {
                        Text("Find Donations")
                            .padding()
                        
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    .padding() // Add padding to the button
                }
            }
            .navigationBarTitle("") // Hide the navigation bar title
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
