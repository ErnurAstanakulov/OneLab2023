import SwiftUI

//MARK: Тут все плоховато как-то...

struct RoundButton: View {
    var imageName: String
    var color: Color
    var borderColor: Color
    
    var body: some View {
        Button(action: {
            // Add your button action here
        }) {
            Image(systemName: imageName)
                .foregroundColor(Color.white)
                .padding(15)
                .background(color)
                .clipShape(Circle())
                .buttonBorderShape(.automatic)
                .overlay(
                    Circle()
                        .stroke(borderColor, lineWidth: 1)
                )
        }
    }
}

struct ButtonLabel: View {
    var button: RoundButton
    var text: String
    
    var body: some View {
        VStack(spacing: 10) {
            button.frame(width: 90, height: 60)
            Text(text)
                .font(.callout)
        }
    }
}

struct ContentView: View {
    var body: some View {
        Color.gray
            .blur(radius: 100)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack(spacing: 200) {
                    VStack {
                        Text("Jane Appleseed")
                            .font(.largeTitle)
                        Text("00:02")
                    }
                    VStack{
                        HStack(alignment: .center) {
                            ButtonLabel(button: RoundButton(imageName: "mic.fill", color: .clear, borderColor: .white), text: "mute")
                            ButtonLabel(button: RoundButton(imageName: "touchid", color: .clear, borderColor: .white), text: "keypad")
                            ButtonLabel(button: RoundButton(imageName: "speaker.fill", color: .clear, borderColor: .white), text: "speaker")
                        }

                        Spacer()

                        HStack(alignment: .center) {
                            ButtonLabel(button: RoundButton(imageName: "plus", color: .clear, borderColor: .white), text: "call")
                            ButtonLabel(button: RoundButton(imageName: "video.fill", color: .clear, borderColor: .white), text: "FaceTime")
                            ButtonLabel(button: RoundButton(imageName: "person.crop.circle.fill", color: .clear, borderColor: .white), text: "contacts")
                        }
                    }

                    Button(action: {}) {
                        RoundButton(imageName: "phone.fill", color: .red, borderColor: .red)
                    }
                    .frame(width: 80, height: 80)
                }
                .padding(),
                alignment: .center
            )
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
