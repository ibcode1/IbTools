//
//  File.swift
//  
//
//  Created by Ibrahim fuseini on 27/05/2024.
//

import SwiftUI

/// This extension is in place to allow custom made colors to be used on the `ShapeStyle` protocol
public extension ShapeStyle where Self == Color {

  // MARK: - Primary Colors
  /// This is the `orangePrimary` color
  static var orangePrimary: Color {
    Color(.orangePrimary)
  }

  static var bluePrimary: Color {
    Color(.bluePrimary)
  }

  static var greenPrimary: Color {
    Color(.greenPrimary)
  }

  static var midnightPrimary: Color {
    Color(.midnightPrimary)
  }

  static var purplePrimary: Color {
    Color(.purplePrimary)
  }

  static var redPrimary: Color {
    Color(.redPrimary)
  }

  static var yellowPrimary: Color {
    Color(.yellowPrimary)
  }
}
