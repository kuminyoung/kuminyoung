//
//  MainView.swift
//  Baguni
//
//  Created by 윤영서 on 2021/05/25.
//

import SwiftUI

struct MainView: View {
    
    @State var show = false
    @State var text = ""
    var columns = Array(repeating: GridItem(.flexible()), count: 2)
    
 
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
                    
                    Text("BAGUNI")
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
                        ZStack{

                            
                            LazyVGrid(columns: columns, spacing: 20) {
                                
                                ForEach(mData.filter({"\($0)".contains(text.lowercased()) || text.isEmpty})){ i in
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 30)
                                            .fill(Color(.systemGray6))
                                            .frame(width: 160, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        VStack(alignment: .leading) {
                                            
                                            Image(i.Pimage)
                                                .resizable()
                                                .frame(width: 120, height: 120)
                                                
                                            
                                            Text(i.title)
                                            Text(i.subtitle)
                                            
                                            

                                        }
                                        
                                        Button(action: {
                                            withAnimation{self.show.toggle()}
                                        }){
                                            Image("MainViewLocation_orange")
                                                .resizable()
                                                .frame(width: 25, height: 25)

                                        }
                                        .offset(x: 55,y: 75)

                                    }
                                    
                                }
                                .padding(.top, 30)


                                
                            }
                        }
                    }
                    .padding(.top, 33)
                    
                    if self.show{
                        GeometryReader{_ in
                            Place()
                        }.background(
                            Color.black.opacity(0.65)
                                .cornerRadius(50)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, 19)
                                .onTapGesture {
                                    withAnimation{
                                        self.show.toggle()

                                    }
                                }
                        )
                    }
                    
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}


struct Place: View {
    var body: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack(spacing: 12){
                Image("MainViewLocation_orange").renderingMode(.original).resizable().frame(width: 38, height: 35)
                VStack{
                    Text("B1층 신선식품")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    

                }
                
//                Text(i.place)
//                ForEach(mData){ i in
//                    Text(i.place)
//                }


            }

        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .padding(.top, 250)
        .padding(.leading, 100)
        .padding(.trailing, 100)


    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
