//
//  CardManager.swift
//  Baguni
//
//  Created by 윤영서 on 2021/05/22.
//

import SwiftUI

class CardManager: ObservableObject {
    
    let currentDateString = "19 Sep 2020"
    
    func getUniqueDates(for cardNumber: String) -> [String] {
        var dates: [String] = []
        
        var lastDate = ""
        
        for transaction in transactions {
            if transaction.card == cardNumber && transaction.date != lastDate {
                dates.append(transaction.date)
                lastDate = transaction.date
            }
        }
        return dates
    }
    
    func getModifiedDate(date: String) -> String {
        var modifiedDate = date
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMM yyyy"
        
        if let currentDate = dateFormater.date(from: currentDateString) {
            if let givenDate = dateFormater.date(from: date) {
                let difference = Calendar.current.dateComponents([.day], from: currentDate, to: givenDate)
                if abs(difference.day!) == 0{
                    modifiedDate = "Today"
                } else if abs(difference.day!) == 1 {
                    modifiedDate = "Yesterday"
                }
            }
        }
        return modifiedDate
    }
    
    var lastTransactionID = UUID()
    
    func  getTransaction(for date: String, number: String) -> [TransactionItem] {
        var transaction: [TransactionItem] = []
        
        for transac in transaction {
            if transac.date == date && transac.card == number{
                transaction.append(transac)
            }
        }
        
        if transaction.count > 0 {
            lastTransactionID = transaction.last!.id
        }
        return transaction
    }
}
