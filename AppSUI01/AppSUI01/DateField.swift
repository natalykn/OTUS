//
//  DateField.swift
//  AppSUI01
//
//  Created by Natalia Andryushina on 2021-12-04.
//

import SwiftUI

struct DateField: UIViewRepresentable {
    @Binding var text: String

    private var placeholder = ""

    init(text: Binding<String>) {
        _text = text
    }

    func makeUIView(context: Context) -> UITextField {
        let dateTextField = UITextField()
        dateTextField.placeholder = placeholder
        return dateTextField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.placeholder = placeholder
    }
}

extension DateField {
    func placeholder(_ string: String) -> DateField {
        var view = self
        view.placeholder = string
        return view
    }
}
