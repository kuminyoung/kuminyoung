//
//  CardModels.swift
//  Baguni
//
//  Created by 윤영서 on 2021/05/22.
//

import Foundation

enum CardType: String {
    case KB국민은행
    case 신한은행
    case 우리은행
}

struct Card: Identifiable {
    var id = UUID()
    
    let number: String
    let type: CardType
    let company: String
    
    func getLastForDigit() -> String {
        return String(number.suffix(4))
    }
}

struct TransactionItem: Identifiable, Hashable{
    let id = UUID()
    let date: String
    let time: String
    let company: String
    let service: String
    let card: String
    let amount: Float
    let type: String
}

struct Expence {
    let id = UUID()
    let month: String
    let amount: Float
}
