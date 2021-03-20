//
//  HelloSwiftUIApp.swift
//  HelloSwiftUI
//
//  Created by Tien Do on 11/10/20.
//

import SwiftUI

@main
struct HelloSwiftUIApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  @Environment(\.scenePhase) private var scenePhase
  @StateObject private var landmarkData = LandmarkData()
  
  var body: some Scene {
    WindowGroup {
      ContentView().onOpenURL { url in
        print("Received URL: \(url)")
      }
      .environmentObject(landmarkData)
    }
    .onChange(of: scenePhase) { newPhase in
      switch newPhase {
        case .active:
          print("App is active")
        case .inactive:
          print("App is inactive")
        case .background:
          print("App is in background")
        @unknown default:
          print("Oh - interesting: I received an unexpected new value.")
      }
    }
  }
}
