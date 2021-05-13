//
//  ContentView.swift
//  Baguni
//  Created by 구민영 on 2021/04/30.
//

import SwiftUI
import CodeScanner
import MapKit

//struct NextView: View {
//    @State var scannedCode: String = ""
//
//    var body: some View {
//       Text("\(scannedCode)")
//    }
//}
//
//struct SecondView: View {
//    @State var isPresentingScanner = false
//    @State var scannedCode: String?
//    @State var state = true;
//
//    var body: some View {
//        if self.scannedCode != nil {
//            Text("\(self.scannedCode!)")
//        }
//        Text("").sheet(isPresented: $state, content: {
//            self.scannerSheet
//        })
//    }
//
//    var scannerSheet : some View {
//        CodeScannerView(
//            codeTypes: [.qr],
//            completion: { result in
//                if case let .success(code) = result {
//                    self.scannedCode = code
//                    self.isPresentingScanner = false
//                }
//            }
//        )
//    }
//}

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
    @State var scannedCode: String?
    
    var body: some View {
        VStack() {
            Spacer()
            if self.scannedCode != nil {
                Text("\(self.scannedCode!)")
            }
            
            Button(action: {
                self.isPresentingScanner = true
            }) {
                Image(systemName: "camera.fill")
                    .resizable()
                    .frame(width: 130, height: 100, alignment: .center)
                    .offset(y:-30)
                    .sheet(isPresented: $isPresentingScanner) {
                        self.scannerSheet

                    }
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
                    self.scannedCode = code
                    self.isPresentingScanner = false
                }
            }
        )
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
                            CName = "Kb Card"
                            CNumber = "**** 1234 5678"
                            CBalance = "$ 141,039"
                            
                        }, label: {
                            Image(isCliked ? "Card_1" : "Card_2")
                                .resizable()
                                .padding(.bottom, 0.0)
                                .frame(width: 300, height: 200)
                                .position(x: 200, y: 200)
                                .offset(x: 0, y: isCliked ? 91 : 0)
                        })
                        
                        Button(action: {
                            self.animation()
                            CName = "Shinhan Card"
                            CNumber = "**** 4321 8765"
                            CBalance = "$ 212,928"
                        }, label: {
                            Image(isCliked ? "Card_2" : "Card_1")
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
                            Text(BankName)
                            Text(CName)
                        }
                        HStack{
                            Text(BankNum)
                            Text(CNumber)
                        }
                        HStack{
                            Text(BankBal)
                            Text(CBalance)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
        
    }
}
