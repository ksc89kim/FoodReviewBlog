//
//  OnboardingView.swift
//  OnboardingInterface
//
//  Created by kim sunchul on 11/8/23.
//  Copyright © 2023 com.tronplay. All rights reserved.
//

import SwiftUI
import Util
import DI
import AppStateInterface
import OnboardingInterface

public struct OnboardingView: View, Injectable {

  @StateObject 
  private var viewModel: OnboardingViewModel = DIContainer.resolve(
    for: OnboardingViewModelKey.self
  )

  @StateObject 
  private var appState: AppState = DIContainer.resolve(
    for: AppStateKey.self
  )

  // MARK: - Property

  public var body: some View {
    ZStack {
      UtilAsset.MainColor.background.swiftUIColor.ignoresSafeArea()
      LogoView()
      VStack {
        Spacer()
        Button(
          action: { self.viewModel.trigger(.presentSignup) },
          label: {
            Text("Dating App 시작하기")
              .systemScaledFont(style: .bottomButton)
              .lineLimit(2)
              .background(UtilAsset.MainColor.background.swiftUIColor)
              .foregroundStyle(UtilAsset.MainColor.text.swiftUIColor)
              .padding(.vertical, 18)
              .frame(maxWidth: .infinity)
              .overlay {
                RoundedRectangle(cornerRadius: 8)
                  .stroke(Color.white)
              }
          }
        )
        .buttonStyle(PressedButtonStyle())
        .padding(.horizontal, 24)
        Spacer()
          .frame(height: 32)
      }
      .onAppear {
        self.appState.entranceRouter.navigationTransition = .slide
      }
    }
  }
}


#Preview {
  AppStateDIRegister.register()
  OnboardingDIRegister.register()
  return OnboardingView()
}
