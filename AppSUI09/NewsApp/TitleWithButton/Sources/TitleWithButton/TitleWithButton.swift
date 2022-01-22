import SwiftUI

public struct TitleWithButton : View {
    var text:String
    var buttonAction: (() -> Void)

    public init(text: String, buttonAction: @escaping (() -> Void)) {
        self.text = text
        self.buttonAction = buttonAction
    }
    
    public var body: some View {
        ZStack {
            Spacer()
            Text(text)
                .font(.title)
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        buttonAction()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.largeTitle)
                    }.padding()
                        .offset(x: 10, y: -5)
                }
            }
        }
    }
}
    
    
    
