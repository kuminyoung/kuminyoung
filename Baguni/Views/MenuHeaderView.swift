//
//  MenuHeaderView.swift
//  Baguni
//
//  Created by 윤영서 on 2021/05/22.
//

import SwiftUI

struct MenuHeaderView: View {
    let title: String
    let imageName: String
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 24))
                .bold()
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: imageName)
                    .padding(.all, 20)
            })
        }
        .foregroundColor(.black)
        .padding(.leading, 20)
        .padding(.trailing, 20)

    }
}
