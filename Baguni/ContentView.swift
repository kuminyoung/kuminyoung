//
//  ContentView.swift
//  Baguni
//
//  Created by 구민영 on 2021/04/30.
//

import SwiftUI
import CodeScanner

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
                Image("scan")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
            }
            .frame(width: 50, height: 50, alignment: .center)
            .background(Color.red).clipShape(Circle())
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
        .padding(.bottom, 80)
        .background(Image("Home_page-01-1").resizable())
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
                        /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/
                    }.tag(1)
                Text("Tab Content 2")
                    .tabItem {
                        Image(systemName: "cart")
                        Text("scan")
                    }.tag(2)
                Text("Tab Content 3")
                    .tabItem {
                        Text("Tab Label 3")
                    }.tag(3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
            
    }
}
