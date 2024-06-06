//
//  FontStyle_ext.swift
//
//
//  Created by Ibrahim fuseini on 06/06/2024.
//

import SwiftUI

public extension Text {
  func ibFont(style: IbFontStyle, fontFamily: IbFontFamily = .lexend,
               useScaledFonts: Bool = true) -> Text {
    self.font(.ibFont(style: style, fontFamily: fontFamily, useScaledFonts: useScaledFonts))
  }
}

public extension View {
  func ibFont(style: IbFontStyle, fontFamily: IbFontFamily = .lexend,
               useScaledFonts: Bool = true) -> some View {
    self.font(.ibFont(style: style, fontFamily: fontFamily, useScaledFonts: useScaledFonts))
  }
}

public extension Font {
  static func ibFont(style: IbFontStyle, fontFamily: IbFontFamily,
                      useScaledFonts: Bool = true) -> Font {

    if !didRegisterCutomFonts {
                registerCustomFonts()
            }

    if useScaledFonts {
      return Font.custom(style.fontName(family: fontFamily).rawValue, size: style.fontSize, relativeTo: style.relativeTo)
    }
    else {
      return Font.custom(style.fontName(family: fontFamily).rawValue, fixedSize: style.fontSize)
    }
  }
}

private extension Font {
  static var didRegisterCutomFonts: Bool = false

  /// This method must be called before you can use any non-system / custom font returned by any of the public ⁠ font() ⁠ methods.  Specifically, this means
  /// if you are using ⁠ monterrat ⁠, you must call this method first (⁠ avenir ⁠ is supplied by the OS).
  static func registerCustomFonts() {
    let fontsRequiringRegistration = IbFontName.allCases.filter { $0.requiresRegistration }

    for font in fontsRequiringRegistration {
      guard let url = Bundle.module.url(forResource: font.rawValue, withExtension: "ttf") else {
        //                Log.nonfatal(.unavailableFont(name: font.rawValue))
        continue
      }

      CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
    }

    didRegisterCutomFonts = true
  }
}

public enum IbFontFamily {
  case lexend
}

public enum IbFontName: String, CaseIterable {
  case lexendExtraBold = "Lexend-ExtraBold"
  case lexendLight = "Lexend-Light"
  case lexendRegular = "Lexend-Regular"
  case lexendSemiBold = "Lexend-SemiBold"

  var requiresRegistration: Bool {
          switch self {
          case .lexendExtraBold, .lexendLight, .lexendRegular, .lexendSemiBold: return true
          }
      }
}

public enum IbFontStyle {
  case h2
  case h3
  case regular

  func fontName(family: IbFontFamily) -> IbFontName {
    switch self {
    case .h2:
      switch family {
      case .lexend:
        return .lexendExtraBold
      }

    case .h3:
      switch family {
      case .lexend:
        return .lexendExtraBold
      }

    case .regular:
      switch family {
      case .lexend:
        return .lexendRegular
      }
    }
  }

  var fontSize: CGFloat {
    switch self {
    case .h2:
      return 36.0

    case .h3:
      return 26.0

    case .regular:
      return 16.0

    }
  }

  var relativeTo: Font.TextStyle {
    switch self {
    case .h2:
      return .title2
    case .h3:
      return .title3
    case .regular:
      return .body
    }
  }
}
