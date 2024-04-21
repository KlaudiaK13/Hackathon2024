import SwiftUI
import MessageUI

struct ButtonView: View {
    let link = "https://foodforthepoor.org/help-now/monthly-giving/?utm_campaign=brand-broad&gad_source=1&gclid=CjwKCAjwz42xBhB9EiwA48pT74YsAY_Cg0cckF0sgBqM4sX7_Vbo-KJWDIIWBIf-9yaAXA5x6o37choCIJQQAvD_BwE"
    let fmscLink = "https://give.fmsc.org/give/76206/#!/donation/checkout"
    let thirdlink = "https://give.feedingamerica.org/a/donate"
    let fourthlink = "https://www.chicagosfoodbank.org/?form=FUNFJKHTSMK&_gl=1*1l9szxy*_gcl_au*MTUyMTgyMDY0LjE3MTM2NDI1MDg."
    
    @State private var isShowingMailView = false
    @State private var feedbackText = ""
    
    var body: some View {
        VStack {
            Text("Companies")
                .padding(35)
                .font(.custom("Times New Roman", size: 50)) // Applying Times New Roman font
                .foregroundColor(.white)
                .padding()
                .background(Color(red: 173/255, green: 216/255, blue: 230/255))
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.top)
            
            // Second set of images and buttons (duplicate)
            VStack {
                HStack(spacing: 20) { // Adjust spacing here
                    // First white box with "hi" inside
                    VStack {
                        Image("FFTP") // Add image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        // Button and text inside a square box
                        VStack {
                            Button(action: {
                                if let url = URL(string: link) {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                Text("Donate")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(Color.white) // Light blue color
                                    .cornerRadius(10)
                            }
                            .frame(width: 100, height: 100) // Square box
                            .padding()
                        }
                        .frame(width: 100, height: 100) // Square box
                    }
                    
                    // Second white box with "hi" inside
                    VStack {
                        Image("Image") // Add FMSC logo image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        // Button and text inside a square box
                        VStack {
                            Button(action: {
                                if let url = URL(string: fmscLink) {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                Text("Donate")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(Color.white) // Light blue color
                                    .cornerRadius(10)
                            }
                            .frame(width: 100, height: 100) // Square box
                            .padding()
                        }
                        .frame(width: 100, height: 100) // Square box
                    }
                }
                
                Spacer()
            }
            
            // Third set of images and buttons (duplicate)
            VStack {
                HStack(spacing: 20) { // Adjust spacing here
                    // First white box with "hi" inside
                    VStack {
                        Image("FA") // Add image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        // Button and text inside a square box
                        VStack {
                            Button(action: {
                                if let url = URL(string: thirdlink) {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                Text("Donate")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(Color.white) // Light blue color
                                    .cornerRadius(10)
                            }
                            .frame(width: 100, height: 100) // Square box
                            .padding()
                        }
                        .frame(width: 100, height: 100) // Square box
                    }
                    
                    // Second white box with "hi" inside
                    VStack {
                        Image("GCF") // Add FMSC logo image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        // Button and text inside a square box
                        VStack {
                            Button(action: {
                                if let url = URL(string: fourthlink) {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                Text("Donate")
                                    .font(.headline)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(Color.white) // Light blue color
                                    .cornerRadius(10)
                            }
                            .frame(width: 100, height: 100) // Square box
                            .padding()
                        }
                        .frame(width: 100, height: 100) // Square box
                    }
                }
                
                Spacer()
            }
            
            // White button at the bottom right corner
            ZStack {
                Button(action: {
                    self.isShowingMailView = true
                }) {
                    Text("Suggestions")
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(width: 140, height: 40)
                        .background(Color.white)
                        .cornerRadius(10)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
        }
        .background(Color(red: 173/255, green: 216/255, blue: 230/255).edgesIgnoringSafeArea(.all))
        .sheet(isPresented: $isShowingMailView) {
            MailView(recipient: "KlaudiaKubik2007@gmail.com", feedbackText: $feedbackText)
        }
    }
}

struct MailView: UIViewControllerRepresentable {
    let recipient: String
    @Binding var feedbackText: String
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.setToRecipients([recipient])
        vc.setMessageBody(feedbackText, isHTML: false)
        vc.setSubject("Feedback")
        vc.mailComposeDelegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(feedbackText: $feedbackText)
    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var feedbackText: String
        
        init(feedbackText: Binding<String>) {
            _feedbackText = feedbackText
            super.init()
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            if result == .sent {
                // Feedback sent successfully, clear feedback text
                feedbackText = ""
            }
            controller.dismiss(animated: true)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
