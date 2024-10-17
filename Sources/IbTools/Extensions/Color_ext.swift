//
//  public.swift
//  IbTools
//
//  Created by Christopher J. Roura on 10/17/24.
//


import SwiftUI

/// This extension is in place to allow custom made colors to be used on the `ShapeStyle` protocol
public extension ShapeStyle where Self == Color {

  // MARK: - Background
  /// This is the `backgroundPrimary` color
  static var backgroundPrimary: Color {
      Color(.backgroundPrimary)
  }

  /// This is the `backgroundRaised` color
  static var backgroundRaised: Color {
      Color(.backgroundRaised)
  }

  /// This is the `backgroundRecessed` color
  static var backgroundRecessed: Color {
      Color(.backgroundRecessed)
  }

  // MARK: - Foreground
  /// This is the `foregroundDisabled` color
  static var foregroundDisabled: Color {
      Color(.foregroundDisabled)
  }

  /// This is the `foregroundPrimary` color
  static var foregroundPrimary: Color {
      Color(.foregroundPrimary)
  }

  /// This is the `foregroundSecondary` color
  static var foregroundSecondary: Color {
      Color(.foregroundSecondary)
  }

  /// This is the `foregroundTint` color
  static var foregroundTint: Color {
      Color(.foregroundTint)
  }

  // MARK: - Overlay
  /// This is the `overlayDark` color
  static var overlayDark: Color {
      Color(.overlayDark)
  }

  /// This is the `overlayLight` color
  static var overlayLight: Color {
      Color(.overlayLight)
  }

  // MARK: - Primary Colors
  /// This is the `orangePrimary` color
  static var orangePrimary: Color {
    Color(.orangePrimary)
  }

  /// This is the `bluePrimary` color
  static var bluePrimary: Color {
    Color(.bluePrimary)
  }

  /// This is the `greenPrimary` color
  static var greenPrimary: Color {
    Color(.greenPrimary)
  }

  /// This is the `midnightPrimary` color
  static var midnightPrimary: Color {
    Color(.midnightPrimary)
  }

  /// This is the `Purple` color
  static var purplePrimary: Color {
    Color(.purplePrimary)
  }

  /// This is the `redPrimary` color
  static var redPrimary: Color {
    Color(.redPrimary)
  }

  /// This is the `yellowPrimary ` color
  static var yellowPrimary: Color {
    Color(.yellowPrimary)
  }

  // MARK: - Shadow Colors
  /// This is the `shadow` color
  static var shadow: Color {
      Color(.shadow)
  }
}
