//
//  MainView.swift
//  Baguni
//
//  Created by 윤영서 on 2021/05/25.
//

import SwiftUI

struct MainView: View {
    
    @State var show = false
    @State var show2 = false
    @State var show3 = false
    @State var show4 = false
    @State var show5 = false
    @State var show6 = false
    @State var show7 = false
    @State var show8 = false
    @State var show9 = false



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
                                        
                                        Image("MainViewLocation_orange")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .padding(.leading, 118)
                                            .padding(.top, 160)

                                    }
                                    
                                }
                                .padding(.top, 30)

                            }
                            
                            Button(action: {
                                withAnimation{self.show.toggle()}
                            }){
                                Image("MainViewLocation_orange")
                                    .resizable()
                                    .frame(width: 25, height: 25)

                            }
                            .padding(.trailing, 100)
                            .padding(.bottom, 810)
                            
                            Button(action: {
                                withAnimation{self.show2.toggle()}
                            }){
                                Image("MainViewLocation_orange")
                                    .resizable()
                                    .frame(width: 25, height: 25)

                            }
                            .padding(.leading, 335)
                            .padding(.bottom, 810)
                            
                            Button(action: {
                                withAnimation{self.show3.toggle()}
                            }){
                                Image("MainViewLocation_orange")
                                    .resizable()
                                    .frame(width: 25, height: 25)

                            }
                            .padding(.trailing, 100)
                            .padding(.bottom, 310)
                            
                            
                            Button(action: {
                                withAnimation{self.show4.toggle()}
                            }){
                                Image("MainViewLocation_orange")
                                    .resizable()
                                    .frame(width: 25, height: 25)

                            }
                            .padding(.leading, 335)
                            .padding(.bottom, 310)
                            
//                            Button(action: {
//                                withAnimation{self.show5.toggle()}
//                            }){
//                                Image("MainViewLocation_orange")
//                                    .resizable()
//                                    .frame(width: 25, height: 25)
//
//                            }
//                            .padding(.trailing, 100)
//                            .padding(.bottom, -00)
//
//                            Button(action: {
//                                withAnimation{self.show6.toggle()}
//                            }){
//                                Image("MainViewLocation_orange")
//                                    .resizable()
//                                    .frame(width: 25, height: 25)
//
//                            }
//                            .padding(.leading, 335)
//                            .padding(.bottom, 310)
//
//                            Button(action: {
//                                withAnimation{self.show7.toggle()}
//                            }){
//                                Image("MainViewLocation_orange")
//                                    .resizable()
//                                    .frame(width: 25, height: 25)
//
//                            }
//                            .padding(.trailing, 100)
//                            .padding(.bottom, 310)
//
//                            Button(action: {
//                                withAnimation{self.show8.toggle()}
//                            }){
//                                Image("MainViewLocation_orange")
//                                    .resizable()
//                                    .frame(width: 25, height: 25)
//
//                            }
//                            .padding(.leading, 335)
//                            .padding(.bottom, 310)
//
//                            Button(action: {
//                                withAnimation{self.show9.toggle()}
//                            }){
//                                Image("MainViewLocation_orange")
//                                    .resizable()
//                                    .frame(width: 25, height: 25)
//
//                            }
//                            .padding(.trailing, 100)
//                            .padding(.bottom, 310)
                            
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
                    
                    if self.show2{
                        GeometryReader{_ in
                            Place2()
                        }.background(
                            Color.black.opacity(0.65)
                                .cornerRadius(50)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, 19)
                                .onTapGesture {
                                    withAnimation{
                                        self.show2.toggle()

                                    }
                                }
                        )
                    }
                    
                    if self.show3{
                        GeometryReader{_ in
                            Place3()
                        }.background(
                            Color.black.opacity(0.65)
                                .cornerRadius(50)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, 19)
                                .onTapGesture {
                                    withAnimation{
                                        self.show3.toggle()

                                    }
                                }
                        )
                    }
                    
                    if self.show4{
                        GeometryReader{_ in
                            Place4()
                        }.background(
                            Color.black.opacity(0.65)
                                .cornerRadius(50)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, 19)
                                .onTapGesture {
                                    withAnimation{
                                        self.show4.toggle()

                                    }
                                }
                        )
                    }
                    
                    if self.show5{
                        GeometryReader{_ in
                            Place5()
                        }.background(
                            Color.black.opacity(0.65)
                                .cornerRadius(50)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, 19)
                                .onTapGesture {
                                    withAnimation{
                                        self.show5.toggle()

                                    }
                                }
                        )
                    }
                    
                    if self.show6{
                        GeometryReader{_ in
                            Place6()
                        }.background(
                            Color.black.opacity(0.65)
                                .cornerRadius(50)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, 19)
                                .onTapGesture {
                                    withAnimation{
                                        self.show6.toggle()

                                    }
                                }
                        )
                    }
                    
                    if self.show7{
                        GeometryReader{_ in
                            Place7()
                        }.background(
                            Color.black.opacity(0.65)
                                .cornerRadius(50)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, 19)
                                .onTapGesture {
                                    withAnimation{
                                        self.show7.toggle()

                                    }
                                }
                        )
                    }
                    
                    if self.show8{
                        GeometryReader{_ in
                            Place8()
                        }.background(
                            Color.black.opacity(0.65)
                                .cornerRadius(50)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, 19)
                                .onTapGesture {
                                    withAnimation{
                                        self.show8.toggle()

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

struct Place2: View {
    var body: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack(spacing: 12){
                Image("MainViewLocation_orange").renderingMode(.original).resizable().frame(width: 38, height: 35)
                VStack{
                    Text("2층 가전제품")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
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

struct Place3: View {
    var body: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack(spacing: 12){
                Image("MainViewLocation_orange").renderingMode(.original).resizable().frame(width: 38, height: 35)
                VStack{
                    Text("1층 주방물품")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
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

struct Place4: View {
    var body: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack(spacing: 12){
                Image("MainViewLocation_orange").renderingMode(.original).resizable().frame(width: 38, height: 35)
                VStack{
                    Text("B1층 냉동식품")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
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

struct Place5: View {
    var body: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack(spacing: 12){
                Image("MainViewLocation_orange").renderingMode(.original).resizable().frame(width: 38, height: 35)
                VStack{
                    Text("B1층 신선식품")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
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

struct Place6: View {
    var body: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack(spacing: 12){
                Image("MainViewLocation_orange").renderingMode(.original).resizable().frame(width: 38, height: 35)
                VStack{
                    Text("1층 욕실용품")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
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

struct Place7: View {
    var body: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack(spacing: 12){
                Image("MainViewLocation_orange").renderingMode(.original).resizable().frame(width: 38, height: 35)
                VStack{
                    Text("B1층 냉장식품")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
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

struct Place8: View {
    var body: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack(spacing: 12){
                Image("MainViewLocation_orange").renderingMode(.original).resizable().frame(width: 38, height: 35)
                VStack{
                    Text("B1층 냉장식품")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
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

struct Place9: View {
    var body: some View {

        VStack(alignment: .leading, spacing: 15) {

            HStack(spacing: 12){
                Image("MainViewLocation_orange").renderingMode(.original).resizable().frame(width: 38, height: 35)
                VStack{
                    Text("1층 주방물품")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
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
