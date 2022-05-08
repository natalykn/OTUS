//
//  SettingsViewForProfile.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-03.
//

import SwiftUI
import Photos
import PhotosUI

struct SettingsViewForProfile: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form {
                HeaderBackgroundSliders()
                ProfileSettings()
            }
            .navigationBarTitle(Text("Settings"))
            .navigationBarItems(
                trailing:
                    Button(
                        action: {
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        label: {
                            Text("Done")
                        }
                    )
            )
        }
    }
}
struct ProfileSettings: View {
    @AppStorage("name") var name = DefaultSettings.name
    @AppStorage("description") var description = DefaultSettings.description
    @AppStorage("profileUrl") var profileUrl = DefaultSettings.profileUrl

    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary

    var body: some View {
        Section(header: Text("Profile")) {
            Button(
                action: {
                    isPresenting = true
                },
                label: {
                    Text("Pick Profile Image")
                }
            )
            TextField("Name", text: $name)
            TextEditor(text: $description)
                .padding(.leading, -5.0)
        }
        .sheet(isPresented: $isPresenting) {
            let configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
            PhotoPicker(configuration: configuration, isPresenting: $isPresenting, uiImage: $uiImage)
        }
        .onChange(of: uiImage, perform: { newValue in
            // Convert to Data
            if let data = newValue?.pngData() {
                // Create URL
                let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let url = documents.appendingPathComponent(UUID().uuidString)

                do {
                    // Write to Disk
                    try data.write(to: url)
                    // Store URL in User Defaults
                    profileUrl = url
                } catch {
                    print("Unable to Write Data to Disk (\(error))")
                }
            }

        })

    }
}

struct HeaderBackgroundSliders: View {
    @AppStorage("rValue") var rValue = DefaultSettings.rValue
    @AppStorage("gValue") var gValue = DefaultSettings.gValue
    @AppStorage("bValue") var bValue = DefaultSettings.bValue

    var body: some View {
        Section(header: Text("Header Background Color")) {
            HStack {
                VStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 100)
                        .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                }
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                VStack {
                    ColorSlider(value: $rValue, textColor: .red)
                    ColorSlider(value: $gValue, textColor: .green)
                    ColorSlider(value: $bValue, textColor: .blue)
                }
            }
        }
    }
}

struct SettingsViewForProfile_Previews: PreviewProvider {
    static var previews: some View {
        SettingsViewForProfile()
    }
}
