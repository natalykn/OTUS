//
//  SettingsViewModel.swift
//  AppSUI01
//
//  Created by Natalia Andryushina on 2021-12-02.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    
    @Published var title: String = "Settings"
    @Published var isTaskShowed: Bool = false
    
}
