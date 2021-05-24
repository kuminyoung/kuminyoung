//
//  ColorConstants.swift
//  Baguni
//
//  Created by 윤영서 on 2021/05/22.
//

import SwiftUI

struct ColorConstants{
    static let primary = Color.init(red: 47/255, green: 16/255, blue: 118/255)
    static let secondary = Color.init(red: 142/255, green: 119/255, blue: 204/255)
    static let imageTint = Color.init(red: 182/255, green: 152/255, blue: 255/255)
    static let imageTint2 = Color.init(red: 120/255, green: 90/255, blue: 201/255)
    static let border = Color.init(red: 66/255, green: 38/255, blue: 135/255)
    
    static let cardBottomLeft = Color.init(red: 252/255, green: 192/255, blue: 0/255)
    static let cardTopRight = Color.init(red: 242/255, green: 143/255, blue: 0/255)
    
    static let cardBottomLeft2 = Color.init(red: 100/255, green: 165/255, blue: 147/255)
    static let cardTopRight2 = Color.init(red: 52/255, green: 112/255, blue: 107/255)
    
    static let graphLine = Color.init(red: 249/255, green: 24/255, blue: 253/255)
    static let graphNumber = Color.init(red: 77/255, green: 49/255, blue: 162/255)
    static let graphBar = Color.init(red: 55/255, green: 25/255, blue: 127/255)
    static let graphBarHighlighted = Color.init(red: 71/255, green: 35/255, blue: 145/255)

    
    static let cardBackground = LinearGradient(
        gradient: Gradient(colors: [cardTopRight, cardBottomLeft]),
        startPoint: .trailing,
        endPoint: .leading)
    
    static let cardBackground2 = LinearGradient(
        gradient: Gradient(colors: [cardTopRight2, cardBottomLeft2]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
    
    
    static let barBackground = LinearGradient(
        gradient: Gradient(colors: [graphBar.opacity(0.2), graphBar.opacity(0.8)]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
    
    
    static let barHighlitedBackgroung = LinearGradient(
        gradient: Gradient(colors: [graphBarHighlighted.opacity(0.2), graphBarHighlighted.opacity(0.8)]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading)
    






}

