//
//  CardView.swift
//  Baguni
//
//  Created by 윤영서 on 2021/05/22.
//

import SwiftUI

struct CardView: View {
    let card: Card 
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 40)
                .fill(ColorConstants.cardBackground)
            
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text(card.company.uppercased())
                            .font(.system(size: 14))
                            .bold()
                            .kerning(2.0)
                        Text(card.type.rawValue.uppercased())
                            .font(.system(size: 14))
                            .bold()
                            .kerning(2.0)
                    }
                    
                    Spacer()
                    
                    Text(card.company.uppercased())
                        .font(.system(size: 24, weight: Font.Weight.heavy))
                        .italic()
                }
                
                Spacer()
                
                HStack{
                    ForEach(0..<3) { i in
                        Text("****")
                            .kerning(3.0)
                        
                        Spacer()
                    }
                    Text(card.getLastForDigit())
                        .kerning(3.0)
                }
            }
            .padding(.all, 40)
        }
        .foregroundColor(.white)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}
