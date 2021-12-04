//
//  CatalogScreen.swift
//  AppSUI01
//
//  Created by Natalia Andryushina on 2021-12-02.
//

import SwiftUI


struct CatalogScreen: View {
    @Binding var selection: Tab
    @Binding var selectedItem: Int?

    var body: some View {
        UserBlock(selection: $selection, selectedItem: $selectedItem)
    }
}

struct UserBlock: View {
    @Binding var selection: Tab
    @Binding var selectedItem: Int?

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image(systemName:"book").resizable().scaledToFit()
                Spacer()
            }
            Spacer()
            Button(action: {
                self.selection = Tab.home
            
            }) {
                Text("Home").font(.largeTitle)
            }
            Spacer()
            Button(action: {
                self.selection = Tab.home
                self.selectedItem = 0
                
            }) {
                Text("Home.Name").font(.largeTitle)
            }

            Spacer()
        }
    }
}

#if DEBUG
struct CatalogScreen_Previews: PreviewProvider {
    static var previews: some View {
        CatalogScreen(selection: .constant(Tab.home), selectedItem: .constant(nil))
    }
}
#endif
