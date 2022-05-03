//
//  SettingsStore.swift
//  Fungi Incognita
//
//  Created by Natalia Andryushina on 2022-05-03.
//

import SwiftUI
import Combine

final class SettingsStore: ObservableObject {
    private enum Keys {
        static let pro = "pro"
        static let saveImage = "save_image"
        static let notificationEnabled = "notifications_enabled"
        static let profileUrlKey = "profileUrl"

     /*   static let sleepTrackingEnabled = "sleep_tracking_enabled"
        static let sleepTrackingMode = "sleep_tracking_mode"*/
    }

    private let cancellable: Cancellable
    private let defaults: UserDefaults

    let objectWillChange = PassthroughSubject<Void, Never>()

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults

        defaults.register(defaults: [
            Keys.saveImage: true,
            Keys.profileUrlKey: URL(fileURLWithPath: "")
           /* Keys.sleepTrackingEnabled: true,
            Keys.sleepTrackingMode: SleepTrackingMode.moderate.rawValue*/
            ])

        cancellable = NotificationCenter.default
            .publisher(for: UserDefaults.didChangeNotification)
            .map { _ in () }
            .subscribe(objectWillChange)
    }

    var isNotificationEnabled: Bool {
        get { defaults.bool(forKey: Keys.notificationEnabled) }
        set { defaults.set(newValue, forKey: Keys.notificationEnabled) }
    }

    var isPro: Bool {
        get { defaults.bool(forKey: Keys.pro) }
        set { defaults.set(newValue, forKey: Keys.pro) }
    }

    var saveImage: Bool {
        get { defaults.bool(forKey: Keys.saveImage) }
        set { defaults.set(newValue, forKey: Keys.saveImage) }
    }

    var profileUrl: URL {
        get { defaults.url(forKey: Keys.profileUrlKey) ?? URL(fileURLWithPath: "") }
        set { defaults.set(newValue, forKey: Keys.profileUrlKey) }
    }

 /*   var isSleepTrackingEnabled: Bool {
        set { defaults.set(newValue, forKey: Keys.sleepTrackingEnabled) }
        get { defaults.bool(forKey: Keys.sleepTrackingEnabled) }
    }

    var saveImage: Int {
        set { defaults.set(newValue, forKey: Keys.saveImage) }
        get { defaults.integer(forKey: Keys.saveImage) }
    }

    enum SleepTrackingMode: String, CaseIterable {
        case low
        case moderate
        case aggressive
    }

    var sleepTrackingMode: SleepTrackingMode {
        get {
            return defaults.string(forKey: Keys.sleepTrackingMode)
                .flatMap { SleepTrackingMode(rawValue: $0) } ?? .moderate
        }

        set {
            defaults.set(newValue.rawValue, forKey: Keys.sleepTrackingMode)
        }
    }*/
}

extension SettingsStore {
    func unlockPro() {
        // You can do your in-app transactions here
        isPro = true
    }

    func restorePurchase() {
        // You can do you in-app purchase restore here
        isPro = true
    }
}
