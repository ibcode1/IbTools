//
//  FontManager.swift
//  IbTools
//
//  Created by Ibrahim fuseini on 16/12/2024.
//

import IbFoundation
import UIKit

// MARK: - FontManager class

public class FontManager {

  public init() {}

  private var didRegisterCustomFonts: Bool = false

  public func registerCustomFonts() {

    guard didRegisterCustomFonts == false else { return }
    didRegisterCustomFonts = true

    let fontsRequiringRegistration = IbFontName.allCases.filter { $0.requiresRegistration }

    for font in fontsRequiringRegistration {
      registerFont(named: font.rawValue)
    }
  }

  private func registerFont(named fontName: String) {

    guard
      let url = Bundle.module.url(forResource: fontName, withExtension: "ttf"),
      CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
    else {

      print("Unable to register fonts")
      return
    }
  }
}
