//
//  SwiftUIView.swift
//  AppWithWidget
//
//  Created by Natalia Andryushina on 2022-05-14.
//

import SwiftUI

struct FeedView: View {
    @EnvironmentObject var suffixModel: SuffixModel

    var body: some View {
        VStack {
            List{
                ForEach(self.suffixModel.history, id:\.self){ text in
                    Text(text)
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
