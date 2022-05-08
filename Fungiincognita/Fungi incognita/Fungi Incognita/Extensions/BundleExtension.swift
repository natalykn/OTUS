//
//  BundleExtension.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-08.
//

import SwiftUI

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    var releaseVersionNumberPretty: String {
        return "\(releaseVersionNumber ?? "1.0").\(buildVersionNumber ?? "0")"
    }

    var copyright: String {
        return infoDictionary?["NSHumanReadableCopyright"] as? String ?? ""
    }

    var appName: String {
        return infoDictionary?["CFBundleDisplayName"] as? String ?? ""
    }

    var iconFileName: String? {
        guard let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
              let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
              let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
              let iconFileName = iconFiles.last
        else { return nil }
        return iconFileName
    }

}

struct AppIcon: View {
    var body: some View {
        Bundle.main.iconFileName
            .flatMap { UIImage(named: $0) }
            .map { Image(uiImage: $0) }
    }
}
