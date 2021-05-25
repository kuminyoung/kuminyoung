//
//  ContentView.swift
//  Baguni
//  Created by 구민영 on 2021/04/30.
//

import SwiftUI
import CodeScanner
import MapKit




struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    var body: some View {
        HStack {
            TextField("Search here", text: $text)
                .padding(13)
                .padding(.horizontal, 10)
                .background(Color(.white))
                .foregroundColor(Color(.black))
                .cornerRadius(40)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(ColorConstants.cardTopRight)
                            .frame(minWidth: 0, maxWidth:  .infinity, alignment: .trailing)
                            .padding(.trailing, 5)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }, label: {
                                
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color(.systemGray4))
                                    .padding(.trailing, 10)
                                
                            })
                        }
                    }
                ).onTapGesture {
                    self.isEditing = true
                }
                .padding(.trailing, 20)
                .padding(.leading, 20)
        }
    }
}


struct ScanView: View {
    @State var text = ""
    @State var isPresentingScanner = false
    @State var scannedCodes: [Purchase] = []
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(ColorConstants.cardBackground)
            
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.white)
                .padding(.top, 160)
            
            VStack {
                CartTopBarView()
        
            VStack() {
                GeometryReader { geometry in
                    VStack {
                        VStack {
                            List(scannedCodes){
                                product in ListRow(eachPurchase: product)
                            }
                        }.frame(width: .infinity, height: 480, alignment: .leading)
                        Button(action: {
                            self.isPresentingScanner = true
                        }) {
                            Image(systemName: "camera.fill").resizable()
                        }
                        .frame(width: 55, height: 45, alignment: .leading)
                        .sheet(isPresented: $isPresentingScanner) {
                            self.scannerSheet
                        }
                        TotalRow(totalPrice: self.scannedCodes.map { $0.price }.reduce(0, +)).font(.system(size: 25))
                    }
                    .frame(
                        minWidth: 0,
                        idealWidth: 100,
                        maxWidth: .infinity,
                        minHeight: 0,
                        idealHeight: 100,
                        maxHeight: .infinity,
                        alignment: .leading
                    )
                    .edgesIgnoringSafeArea(.all)
                }
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }

    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    if let productData = convertToDictionary(text: code) {
                        let purchaseData = Purchase(
                            id: productData["id"] as! Int,
                            imageURL: productData["imageURL"] as! String,
                            name: productData["productName"] as! String,
                            price: productData["price"] as! Int
                        )
                        self.scannedCodes.append(purchaseData)
                    }
                    self.isPresentingScanner = false
                }
            }
        )
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}

struct TotalRow: View {
    var totalPrice: Int
    
    var body: some View{
        Text("₩\(totalPrice)")
    }
}

struct ListRow: View {
    var eachPurchase: Purchase
    @State var stepperValue = 1
    
    var body: some View{
        GeometryReader { geometry in
            HStack{
                
                Image(
                    uiImage: imageFromURL(url: eachPurchase.imageURL)
                )
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(maxWidth: geometry.size.width * 0.15, alignment: .leading)
                Text(eachPurchase.name).frame(width: geometry.size.width * 0.25, alignment: .leading)
                Text("₩\(eachPurchase.price*self.stepperValue)").frame(width: geometry.size.width * 0.25, alignment: .leading)
                Stepper(value: $stepperValue, in: 1...50) {
                    Text("\(self.stepperValue)")
                }.frame(width: geometry.size.width * 0.35, alignment: .leading)
            }
        }.padding(.leading, 10).padding(.trailing, 10)
    }
}

func imageFromURL(url: String) -> UIImage {
    let url = URL(string: url)
    let data = try! Data(contentsOf: url!)
    return UIImage(data: data)!
}

struct PurchaseList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScanView()
            ScanView()
        }
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
                ScanView()
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
        
        ZStack {

            VStack{
                Rectangle()
                    .fill(ColorConstants.cardBackground)
                    .padding(.top, -100)
                
                ZStack(alignment: .top){
                    
                    
                        MapView(landmarks: landmarks)
                        
                        TextField("Search", text: $search, onEditingChanged:{ _ in } )
                        {
                            // commit
                            self.getNearByLandmarks()
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top, -120)
                        .offset(y: 44)
                        
                        PlaceListView(landmarks: self.landmarks) {
                            //on tap
                            self.tapped.toggle()
                        }
                        .animation(.spring())
                        .offset(y:calculateOffset())
                    
                    HStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "line.horizontal.3")
                                .padding(.all, 10)
                        })
                        
                        Text("LOCATION")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                        
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding(.top, -144)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                }
                .padding(.top, -200)
                
            }
        }
    }
}

struct PaymentView: View {
    
    @ObservedObject var cardManager = CardManager()
    @State private var currentPage = 0
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(ColorConstants.cardBackground)
            
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.white)
                .padding(.top, 160)
            
            VStack {
                TopBarView()
                VStack{
                    PagerView(pageCount: cards.count, currentIndex: $currentPage) {
                        ForEach(cards) { card in
                            CardView(card: card)
                        }
                        
                    }
                    .frame(height: 240)
                    MenuHeaderView(title: "구매내역", imageName: "chevron.down")
                    
                    TransactionListView(currentIndex: $currentPage, cardManager: cardManager)
                    
                    Spacer()
               
                }.padding(.top, 80)
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
                    ForEach(getTransactions(date: date), id: \.self) { transaction in
                        TransactionListRow(transaction: transaction, isLast: cardManager.lastTransactionID == transaction.id)
                        
                    }
                }
            }
        }
    }
    
    func getTransactions(date: String) -> [TransactionItem] {
        return cardManager.getTransaction(for: date, number: cards[currentIndex].number)
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
                .foregroundColor(.black)
                .padding(.leading, 20)
            Spacer()
        }
    }
}

//ㅅㅂㅅㅂㅅㅂㅆㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅㅂㅅ왜안돼ㄸㅗㅅㅂㅅㅃㅅㅂ
//ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ

struct TransactionListRow: View {
    let transaction: TransactionItem
    let isLast: Bool
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ZStack {
                    Circle()
                        .fill(ColorConstants.border)
                        .frame(width: 50, height: 50)
                    Image(systemName: "applelogo")
                        .foregroundColor(ColorConstants.secondary)
                }
                
                VStack(alignment: .leading) {
                    Text(transaction.service)
                        .foregroundColor(.white)
                    Text(transaction.type)
                        .font(.caption)
                        .foregroundColor(ColorConstants.secondary)
                }
                .padding(.leading, 10)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("- \(String(format: "%.2f", transaction.amount)) USD")
                        .foregroundColor(.white)
                    Text(transaction.time)
                        .font(.caption)
                        .foregroundColor(ColorConstants.secondary)
                }
            }
            
            
            Divider()
                .background(ColorConstants.secondary)
                .opacity(isLast ? 0.0 : 1.0)
                .padding(.leading, 60)
                .padding(.bottom, 8)
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}




struct TopBarView: View {
    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "line.horizontal.3")
                    .padding(.all, 10)
            })
            
            Text("PAYMENT")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            
            Spacer()
            
// 서치 바에 넣을 버튼
//            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                Image(systemName: "magnifyingglass")
//                    .padding(.all, 20)
//            })
        }
        .foregroundColor(.white)
        .padding(.top, 64)
        .padding(.bottom, 20)
        .padding(.leading, 20)
        .padding(.trailing, 20)

    }
}

struct HomeTopBarView: View {
    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "line.horizontal.3")
                    .padding(.all, 10)
            })
            
            Text("Baguni")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            
            Spacer()
            
        }
        .foregroundColor(.white)
        .padding(.top, 64)
        .padding(.bottom, 20)
        .padding(.leading, 20)
        .padding(.trailing, 20)

    }
}

struct CartTopBarView: View {
    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "line.horizontal.3")
                    .padding(.all, 10)
            })
            
            Text("CART")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            
            Spacer()
            
        }
        .foregroundColor(.white)
        .padding(.top, 64)
        .padding(.bottom, 20)
        .padding(.leading, 20)
        .padding(.trailing, 20)

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
        
    }
}
