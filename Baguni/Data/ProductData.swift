//
//  ProductData.swift
//  Baguni
//
//  Created by 윤영서 on 2021/05/25.
//

import Foundation

struct MyData: Identifiable {
    var id = UUID()
    var Pimage: String
    var title: String
    var subtitle: String
    var place: String

}


var mData = [
    MyData(Pimage: "Banana", title: "델몬트) 바나나", subtitle: "4,300원", place: "B1층 신선식품 코너"),
    MyData(Pimage: "Dyson", title: "다이슨) V6", subtitle: "464,650원", place: "2층 가전제품 코너"),
    MyData(Pimage: "WoodenBowl", title: "나무 그릇 세트", subtitle: "11,200원", place: "1층 주방물품 코너"),
    MyData(Pimage: "Gyoja", title: "비비고) 왕교자", subtitle: "3,180원", place: "B1층 냉동식품 코너"),
    MyData(Pimage: "appleMango", title: "애플망고", subtitle: "4,130원", place: "B1층 신선식품 코너"),
    MyData(Pimage: "FootMat", title: "발매트", subtitle: "5,800원", place: "1층 욕실용품 코너"),
    MyData(Pimage: "coke", title: "코카콜라 x24", subtitle: "21,890원", place: "B1층 냉장식품 코너"),
    MyData(Pimage: "Yogert", title: "액티비아 x6", subtitle: "6,100원", place: "B1층 냉장식품 코너"),
    MyData(Pimage: "DishCloth", title: "행주", subtitle: "410원", place: "1층 주방물품 코너"),

]

