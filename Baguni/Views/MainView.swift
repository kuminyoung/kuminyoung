//
//  MainView.swift
//  Baguni
//
//  Created by 윤영서 on 2021/05/25.
//

import SwiftUI

struct MainView: View {
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    @State var text = ""
 
    var body: some View {
        ZStack {
            Rectangle()
                .fill(ColorConstants.cardBackground)
            VStack {

                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "line.horizontal.3")
                            .padding(.all, 10)
                    })
                    
                    Text("BAGUNI CART")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                    Spacer()

                }
                .foregroundColor(.white)
                .padding(.top, 64)
                .padding(.bottom, 20)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
                SearchBar(text: $text)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color.white)
                        .padding(.top, 19)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(mData.filter({"\($0)".contains(text.lowercased()) || text.isEmpty})){ i in
                                ZStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(Color(.systemGray6))
                                        .frame(width: 160, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    VStack {
                                        Text(i.title)
                                        
                                        Text(i.subtitle)
                                    }
                                    .padding(.all, 30)


                                }
                            }
                            .padding(.top, 80)

                        }
                    }
                    
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
