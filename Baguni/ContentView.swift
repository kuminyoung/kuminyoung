//
//  ContentView.swift
//  Baguni
//  Created by 구민영 on 2021/04/30.
//

import SwiftUI
import CodeScanner
import MapKit

struct MainView: View {
    
    let BankName = "카드이름:"
    let BankNum = "카드번호:"
    let BankBal = "잔액:"
    
    @State var CName = "Kb Card"
    @State var CNumber = "**** 1234 5678"
    @State var CBalance = "$ 141,039"
    
    @State private var isCliked : Bool = false
    var body: some View {
        NavigationView{
            GeometryReader {
                geometry in
                ZStack{
                    Image("HomePageForExample")
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack{
                        
                        Button(action: {
                            self.animation()
  
                            
                        }, label: {
                            Image(isCliked ? "" : "")
                                .resizable()
                                .padding(.bottom, 0.0)
                                .frame(width: 300, height: 200)
                                .position(x: 200, y: 200)
                                .offset(x: 0, y: isCliked ? 91 : 0)
                        })
                        
                        Button(action: {
                            self.animation()

                        }, label: {
                            Image(isCliked ? "" : "")
                                .resizable()
                                .frame(width: 300, height: 200)
                                .position(x: 200, y: 10)
                                //                            .rotation3DEffect(
                                //                                isCliked ? .degrees(360) : .degrees(0),
                                //                                axis: (x : 1.0, y : 1.0, z : 1.0)
                                //                            )
                                .offset(x: 0, y: isCliked ? -91 : 0)
                            
                            
                        })
                        HStack{
                            Text("")
                            Text("")
                        }
                        HStack{
                            Text("")
                            Text("")
                        }
                        HStack{
                            Text("")
                            Text("")
                        }
                    }
                }
            }
        }
        .navigationTitle("Payment")
    }
    func animation(){
        self.isCliked.toggle()
    }
}


struct ScanView: View {
    @State var isPresentingScanner = false
    @State var scannedCodes: [String] = []
    
    var purchaseToList: [Purchase]
    
    var body: some View {
        NavigationView{
            List(purchaseToList){
                product in ListRow(eachPurchase: product)
            }.navigationBarTitle(Text("담은 상품"))
        }
        VStack() {
            Spacer()
            ForEach(self.scannedCodes, id: \.self) { scannedCode in
                Text("\(scannedCode)")
            }
            
            Button(action: {
                self.isPresentingScanner = true
            }) {
                Image(systemName: "camera.fill")
                    .resizable()
                    }
            .frame(width: 45, height: 35, alignment: .center)
            .offset(y:-40)
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
        .padding(.bottom, 80)
        .background(Image("HomePageForExample").resizable())
        .edgesIgnoringSafeArea(.all)
        
    }

    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCodes.append(code)
                    self.isPresentingScanner = false
                }
            }
        )
    }
}

struct ListRow: View {
    var eachPurchase: Purchase
    var body: some View{
        HStack{
            Text(eachPurchase.name)
            Spacer()
            Image("신라면")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 40)
        }
    }
}

var products = [
    Purchase(id: 1, name: "신라면", price: 900),
    Purchase(id: 2, name: "오렌지주스", price: 2700),
    Purchase(id: 3, name: "하리보젤리", price: 1000),
    Purchase(id: 4, name: "저지방우유", price: 2200),
    Purchase(id: 5, name: "새우깡", price: 900),
]

struct PurchaseList_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(purchaseToList: products)
    }
}
    


struct QRCodeScannerExampleView: View {
    
    var body: some View {
        HStack {
            TabView() {
                MainView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(1)
                ScanView(purchaseToList: products)
                    .tabItem {
                        Image(systemName: "cart.badge.plus")
                        Text("scan")
                    }.tag(2)
                LocationView()
                    .tabItem {
                        Image(systemName: "paperplane.circle")
                        Text("Map")
                    }.tag(3)
                PaymentView()
                    .tabItem {
                        Image(systemName: "creditcard.fill")
                        Text("Payment")
                    }.tag(4)
            }.accentColor(.orange)
        }
    }
}

struct LocationView: View {
    
    @ObservedObject var locationManager = LocationManager()
    @State private var landmarks: [Landmark] = [Landmark]()
    @State private var search: String = ""
    @State private var tapped: Bool = false
    
    private func getNearByLandmarks() {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    Landmark(placemark: $0.placemark)
                }
                
            }
            
        }
    }
    
    func calculateOffset() -> CGFloat {
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height/4
        }
        else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    var body: some View {
        ZStack(alignment: .top){
            
            MapView(landmarks: landmarks)
            

            TextField("Search", text: $search, onEditingChanged:{ _ in } )
            {
                // commit
                self.getNearByLandmarks()
            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .offset(y: 44)
            
            PlaceListView(landmarks: self.landmarks) {
                //on tap
                self.tapped.toggle()
            }.animation(.spring())
            .offset(y:calculateOffset())
        }
    }
}

struct PaymentView: View {
    
    @ObservedObject var cardManager = CardManager()
    @State private var currentPage = 0
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(ColorConstants.primary)
            
            VStack {
                PagerView(pageCount: cards.count, currentIndex: $currentPage) {
                    ForEach(cards) { card in
                        CardView(card: card)
                    }
                }
                .frame(height: 240)
                .padding(.top, 120)
                
                MenuHeaderView(title: "Purchase History", imageName: "chevron.down")
                
                TransactionListView(currentIndex: $currentPage, cardManager: cardManager)
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)

    }
}

struct TransactionListView: View {
    @Binding var currentIndex: Int
    @ObservedObject var cardManager: CardManager
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(getListHeaders(), id: \.self) { date in
                    ListHeader(title: cardManager.getModifiedDate(date: date))
                    
                }
            }
        }
    }
    
    func getListHeaders() -> [String] {
        return cardManager.getUniqueDates(for: cards[currentIndex].number)
    }
}

struct ListHeader: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.caption)
                .foregroundColor(ColorConstants.secondary)
                .padding(.leading, 20)
            Spacer()
        }
    }
}

struct TransactionListRow: View {
    var body: some View {
        VStack {
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
        
    }
}
