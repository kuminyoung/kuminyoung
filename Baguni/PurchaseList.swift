//
//  ListList.swift
//  Baguni
//
//  Created by 구민영 on 2021/05/22.
//

//import SwiftUI
//
//struct PurchaseList: View {
//    var purchaseToList: [Purchase]
//    var body: some View {
//        NavigationView{
//            List(purchaseToList){
//                product in ListRow(eachPurchase: product)
//            }.navigationBarTitle(Text("담은 상품"))
//        }
//    }
//}
//
//
//struct ListRow: View {
//    var eachPurchase: Purchase
//    var body: some View{
//        HStack{
//            Text(eachPurchase.name)
//            Spacer()
//            Image("신라면")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(maxWidth: 40)
//        }
//    }
//}
//
//
//var products = [
//    Purchase(id: 1, name: "신라면", price: 900),
//    Purchase(id: 2, name: "오렌지주스", price: 2700),
//    Purchase(id: 3, name: "하리보젤리", price: 1000),
//    Purchase(id: 4, name: "저지방우유", price: 2200),
//    Purchase(id: 5, name: "새우깡", price: 900),
//]
//
//struct ListList_Previews: PreviewProvider {
//    static var previews: some View {
//        PurchaseList(purchaseToList: products)
//    }
//}
