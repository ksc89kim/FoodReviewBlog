//
//  SignupInputNicknameVie.swift
//  User
//
//  Created by kim sunchul on 11/11/23.
//  Copyright © 2023 com.tronplay. All rights reserved.
//

import SwiftUI
import Util

struct SignupInputNicknameView: View {

  @Binding
  var nickname: String

  @State
  var limitCount: Int = 0

  @Environment(\.sizeCategory) var sizeCategory

  var body: some View {
    VStack(alignment: .leading) {
      Text("닉네임을 만들어볼까요?")
        .systemScaledFont(font: .bold, size: 24)
        .padding(.bottom, 8)
      Text("프로필에 표시되는 이름으로, 언제든지 변경할 수 있어요.")
        .systemScaledFont(style: .placeHolder)
        .foregroundStyle(UtilAsset.MainColor.placeHolder.swiftUIColor)
        .padding(.bottom, 24)
      TextField(
        String(),
        text: self.$nickname.max(self.limitCount),
        prompt: Text("닉네임을 입력해주세요.")
          .font(
            .system(
              size: UIFontMetrics.default.scaledValue(for: 22),
              weight: .semibold
            )
          )
      )
      Divider()
        .padding(.bottom, 4)
      Text("최대 \(self.limitCount)자")
        .systemScaledFont(style: .placeHolder)
        .foregroundStyle(UtilAsset.MainColor.placeHolder.swiftUIColor)
    }
    .frame(
      maxWidth: .infinity,
      maxHeight: .infinity,
      alignment: .topLeading
    )
  }
}


#Preview {
  SignupInputNicknameView(nickname: Binding(
    get: { "" },
    set: { _ in }
  ))
}
