//
//  File.swift
//  
//
//  Created by Ibrahim fuseini on 27/05/2024.
//

import SwiftUI

/// This extension is in place to allow custom made colors to be used on the `ShapeStyle` protocol
public extension ShapeStyle where Self == Color {
  /// This is the `orangePrimary` color 
  static var orangePrimary: Color {
    Color(.orangePrimary)
  }
}
