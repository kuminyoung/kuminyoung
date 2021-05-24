//
//  Data.swift
//  Baguni
//
//  Created by 윤영서 on 2021/05/22.
//

import Foundation


let cards = [
    Card(number: "1223455622115610", type: CardType.우리은행, company: "Visa"),
    Card(number: "1223455622114311", type: CardType.신한은행, company: "Visa"),
    Card(number: "1223455622119521", type: CardType.KB국민은행, company: "Visa")
]

let transactions = [
    TransactionItem(date: "18 Sep 2020", time: "09: 20 AM", company: "Apple", service: "iTunes", card: "1223455622115610", amount: 500, type: "Entertainment"),
    TransactionItem(date: "18 Sep 2020", time:"09: 20 AM", company:"Google", service:"Google Pay", card:"1223455622115610", amount: 450, type: "Entertainment"),
    TransactionItem(date: "17 Sep 2020", time:"02: 10 AM", company:"Nike", service:"Nike", card:"1223455622115610", amount: 200, type: "Entertainment"),
    TransactionItem(date: "17 Sep 2020", time:"07: 10 AM", company:"Adidas", service:"Adidas", card:"1223455622115610", amount: 400, type: "Entertainment"),
    TransactionItem(date: "17 Sep 2020", time:"06: 20 AM", company:"Amazon", service:"Prime", card:"1223455622115610", amount: 100, type: "Entertainment"),
    TransactionItem(date: "17 Sep 2020", time:"05: 30 AM", company:"Google", service:"Google Pay", card:"1223455622114311", amount: 500, type: "Entertainment"),
    TransactionItem(date: "16 Sep 2020", time:"09: 40 AM", company:"Apple", service:"iTunes", card:"1223455622119521", amount: 500, type: "Entertainment")

]

let expences = [
    Expence(month: "Jan", amount: 350.00),
    Expence(month: "Feb", amount: 280.00),
    Expence(month: "Mar", amount: 175.00),
    Expence(month: "Apr", amount: 340.00),
    Expence(month: "May", amount: 600.00),
    Expence(month: "Jun", amount: 320.00),
]
