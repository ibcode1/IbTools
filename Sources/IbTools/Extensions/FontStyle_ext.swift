//
//  FontStyle_ext.swift
//
//
//  Created by Ibrahim fuseini on 06/06/2024.
//

import SwiftUI

public extension Text {

  /// This is the  method you will use to get any standard font defined by a `IbFontStyle`.  Use this method for all "standard" font styles.  If the calling
  /// app contains a one-off custom font style, you can manually create the `FontComponents` and use the other `font(with:useScaledFont:)`
  /// method.
  /// - Parameters:
  ///   - style: The `IbFontStyle` for the font you wish to retrieve.  The style inherently specifies the font weight, standard size and scaling style.
  ///   - fontFamily: The `IbFontFamily` you are using.  This defaults to `lexend` if not explicitly specified.
  ///   - useScaledFont: Whether or not you want to support Dynamic Type.  By default, this is `true` which means the returned font will scale based
  ///   on the user's Dynamic Type font settings.
  /// - Returns: A font reflecting the given parameters
  func ibFont(style: IbFontStyle, fontFamily: IbFontFamily = .lexend,
              useScaledFonts: Bool = true) -> Text {
    self.font(.ibFont(with: style.components(for: fontFamily), useScaledFont: useScaledFonts))
  }
}

public extension View {

  /// This is the  method you will use to get any standard font defined by a `IbFontStyle`.  Use this method for all "standard" font styles.  If the calling
  /// app contains a one-off custom font style, you can manually create the `FontComponents` and use the other `font(with:useScaledFont:)`
  /// method.
  /// - Parameters:
  ///   - style: The `IbFontStyle` for the font you wish to retrieve.  The style inherently specifies the font weight, standard size and scaling style.
  ///   - fontFamily: The `IbFontFamily` you are using.  This defaults to `lexend` if not explicitly specified.
  ///   - useScaledFont: Whether or not you want to support Dynamic Type.  By default, this is `true` which means the returned font will scale based
  ///   on the user's Dynamic Type font settings.
  /// - Returns: A font reflecting the given parameters
  func ibFont(style: IbFontStyle, fontFamily: IbFontFamily = .lexend,
              useScaledFonts: Bool = true) -> some View {
    self.font(.ibFont(with: style.components(for: fontFamily), useScaledFont: useScaledFonts))
  }
}

/// Use this method if you have a one-off font style defined in the calling app.  This method allows you to create your own `FontComponents` structure to
/// define the properties you want in the returned font.  For all standard Ib font styles, use `font(style:fontFmaily:useScaledFont:)` instead.
/// - Parameters:
///   - components: The `FontComponents` that define the font you want returned
///   - useScaledFont: Whether or not you want to support Dynamic Type.  By default, this is `true` which means the returned font will scale based
///   on the user's Dynamic Type font settings.
/// - Returns: A font reflecting the given parameters

public extension Font {
  static func ibFont(
    with components: FontComponents,
    useScaledFont: Bool
  ) -> Font {

    if !didRegisterCutomFonts {
      registerCustomFonts()
    }

    let fontName = components.fontName.rawValue
    let fontSize = components.fontSize

    let finalFont = useScaledFont ?
    Font.custom(fontName, size: fontSize, relativeTo: components.textStyle) :
    Font.custom(fontName, fixedSize: fontSize)

    return finalFont
  }
}

private extension Font {
  static var didRegisterCutomFonts: Bool = false

  /// This method must be called before you can use any non-system / custom font returned by any of the public ⁠ font() ⁠ methods.  Specifically, this means
  /// if you are using ⁠ lexend, you must call this method first (⁠ avenir ⁠ is supplied by the OS).
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
  case lexendSemiBold = "Lexend-SemiBold"
  case lexendBold = "Lexend-Bold"
  case lexendBlack = "Lexend-Black"
  case lexendMedium = "Lexend-Medium"
  case lexendExtraLight = "Lexend-ExtraLight"
  case lexendThin = "Lexend-Thin"

  var requiresRegistration: Bool {
    switch self {
    case .lexendExtraBold, .lexendLight, .lexendSemiBold: return true
    case .lexendBold:
      return true
    case .lexendBlack:
      return true
    case .lexendMedium:
      return true
    case .lexendExtraLight:
      return true
    case .lexendThin:
      return true
    }
  }
}

/// The necessary components that make up a specific `UIFont` within the Ib design system.
public struct FontComponents {
  public let fontName: IbFontName
  public let fontSize: CGFloat
  public let textStyle: Font.TextStyle

  public init(
    fontName: IbFontName,
    fontSize: CGFloat,
    textStyle: Font.TextStyle
  ) {
    self.fontName = fontName
    self.fontSize = fontSize
    self.textStyle = textStyle
  }
}

public enum IbFontStyle: CaseIterable {
  case h2
  case h3
  case h4
  case h5
  case h5Light
  case h5Bold
  case body
  case bodyBold
  case caption
  case captionBold
  case captionExtraBold
  case tiny

  private func fontName(family: IbFontFamily) -> IbFontName {
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

    case .h4:
      switch family {
      case .lexend:
        return .lexendBold
      }
    case .h5:
      switch family {
      case .lexend:
        return .lexendMedium
      }
    case .h5Light:
      switch family {
      case .lexend:  return .lexendExtraLight
      }
    case .h5Bold:
      switch family {
      case .lexend: return .lexendBold
      }
    case .body:
      switch family {
      case .lexend: return .lexendThin
      }
    case .bodyBold:
      switch family {
      case .lexend: return .lexendMedium
      }
    case .caption:
      switch family {
      case .lexend: return .lexendThin
      }
    case .captionBold:
      switch family {
      case .lexend: return .lexendMedium
      }
    case .captionExtraBold:
      switch family {
      case .lexend: return .lexendBold
      }
    case .tiny:
      switch family {
      case .lexend: return .lexendMedium
      }
    }
  }

  /// Maps the given `IbFontStyle` to the appropriate font size
   private var fontSize: CGFloat {
    switch self {
    case .h2:               return 36.0
    case .h3:               return 26.0
    case .h4:               return 20.0
    case .h5:               return 16.0
    case .h5Light:          return 16.0
    case .h5Bold:           return 16.0
    case .body:             return 14.0
    case .bodyBold:         return 14.0
    case .caption:          return 12.0
    case .captionBold:      return 12.0
    case .captionExtraBold: return 12.0
    case .tiny:             return 10.0
    }
  }

  /// Maps the given `IbFontStyle` to `Font.TextStyle` (which is primarily used to describe how the font will scale with dynamic type)
  private var textStyle: Font.TextStyle {
    switch self {
    case .h2:               return .title2
    case .h3:               return .title3
    case .h4:               return .headline
    case .h5:               return .subheadline
    case .h5Light:          return .subheadline
    case .h5Bold:           return .subheadline
    case .body:             return .body
    case .bodyBold:         return .body
    case .caption:          return .caption
    case .captionBold:      return .caption
    case .captionExtraBold: return .caption
    case .tiny:             return .caption2
    }
  }

  internal func components(for family: IbFontFamily) -> FontComponents {
    let fontName = fontName(family: family)
      return FontComponents(fontName: fontName, fontSize: fontSize, textStyle: textStyle)
  }
}
