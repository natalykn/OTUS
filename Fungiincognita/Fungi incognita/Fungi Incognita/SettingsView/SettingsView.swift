//
//  SettingsView.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-04-30.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var setting = Settings()

    var body: some View {
        VStack {
            NavigationView {
                Form {
                    ForEach(Option.options, id: \.id) { settingOption in
                        OptionRow(option: settingOption)
                    }
                }
                .navigationBarTitle("Settings")
            }
            .padding()

            VStack {}
                .frame(height: 80)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct OptionRow: View {
    let option: Option
    var body: some View {
        Group {
            if option.isAddSection {
                Section {
                    OptionSettingsView(option: option)
                }
            } else {
                OptionSettingsView(option: option)
            }
        }
    }
}

struct OptionSettingsView: View {
    let option: Option

    var body: some View {
        return NavigationLink(destination: OptionInnerDetail(option: option)) {
            HStack {
                Image(systemName: "circlebadge")
                    .resizable()
                    .cornerRadius(12)
                    .frame(width: 25, height: 25)
                    .clipped()
                    .aspectRatio(contentMode: .fit)
                Text(option.title)
                    .foregroundColor(.blue)
                    .font(.system(size: 18))
            }
        }
    }
}

struct OptionInnerDetail: View {
    let option: Option
    var body: some View {
        Form {
            ForEach(option.values, id: \.title) { valuesOption in
                OptionInnerView(value: valuesOption)
            }
        }
        .navigationBarTitle(Text(option.title), displayMode: .inline)
    }
}

struct OptionInnerView: View {
    let value: InnerOptionValues
    var body: some View {
        Group {
            if value.isAddSection && !value.isUseToggle {
                Section(header: Text(value.headerTitle)) {
                    InnerView(value: value)
                }
            } else if !value.isAddSection && value.isUseToggle {
                ToggleView(value: value)
            } else if value.isAddSection && value.isUseToggle {
                Section(header: Text(value.headerTitle)) {
                    ToggleView(value: value)
                }
            } else {
                InnerView(value: value)
            }
        }
    }
}

struct ToggleView: View {
    let value: InnerOptionValues
    @ObservedObject var toggle = Settings()

    var body: some View {
        HStack {
            Image(systemName: "circlebadge")
                .resizable()
                .cornerRadius(12)
                .frame(width: 25, height: 25)
                .clipped()
                .aspectRatio(contentMode: .fit)

            Toggle(isOn: $toggle.isToggleOn) {
                Text(value.title)
                    .foregroundColor(.blue)
                    .font(.system(size: 18))
            }
        }
    }
}

struct InnerView: View {
    let value: InnerOptionValues

    var body: some View {
        return NavigationLink(destination: EndView(value: value)) {
            HStack {
                Image(systemName: "circlebadge")
                    .resizable()
                    .cornerRadius(12)
                    .frame(width: 25, height: 25)
                    .clipped()
                    .aspectRatio(contentMode: .fit)
                Text(value.title)
                    .foregroundColor(.blue)
                    .font(.system(size: 18))
            }
        }
    }
}

struct EndView: View {
    let value: InnerOptionValues

    var body: some View {
        return NavigationLink(destination: EndView(value: value)) {

            Text("TODO!!!!")
                .font(.system(size: 25))
                .foregroundColor(.blue)
        } .navigationBarTitle(Text(value.title), displayMode: .inline)
    }
}
