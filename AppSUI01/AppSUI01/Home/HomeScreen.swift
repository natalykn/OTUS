//
//  HomeScreen.swift
//  AppSUI01
//
//  Created by Natalia Andryushina on 2021-12-04.
//

import SwiftUI

struct HomeScreen: View {
    @Binding var selectedItem: Int?
    
    var body: some View {
        VStack {
            Spacer()
            InfoNavigation(selectedItem: $selectedItem)
            Spacer()
        }
        
    }
}



struct InfoNavigation: View {
    @Binding var selectedItem: Int?
    
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "person").resizable().scaledToFit()
            Spacer()
            NavigationView {
                List {
                    NavigationLink("Name", destination: LazyView(NameDetail()), tag: 0, selection: self.customBinding())
                    NavigationLink("Current date", destination: LazyView(CurrentDateDetail()), tag: 1, selection: self.customBinding())
                    
                }
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarTitle(Text("Info"))
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    func customBinding() -> Binding<Int?> {
        let binding = Binding<Int?>(get: {
            self.selectedItem
        }, set: {
            print("Item \(String(describing: $0)) chosen")
            self.selectedItem = $0
        })
        return binding
    }
    
}



struct NameDetail: View {
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName:"face.dashed.fill").resizable().scaledToFit()
            Spacer()
            Text("Natalia").font(.largeTitle)
            Spacer()
        }
    }
    
}

struct CurrentDateDetail: View {
    @State private var text = ""
    @State private var placeHolder = ""
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Spacer()
                Image(systemName:"clock").resizable().scaledToFit()
                Spacer()
                Text(Date.now, format: .dateTime.day().month().year())
                Spacer()
                
            }
            Spacer()
            HStack {
                Spacer()
                
                DateField(text: $text)
                    .placeholder(placeHolder).frame(width: 100, height: 30, alignment: .center)
                Spacer()
            }
            Spacer()
            Button("Tap me") {
                placeHolder = Date.now.formatDate()
            }
            Spacer()
            
        }
    }
}

extension Date {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMM d")
        return dateFormatter.string(from: self)
    }
}


#if DEBUG

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(selectedItem:.constant(nil))
    }
}
#endif
