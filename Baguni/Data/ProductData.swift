//
//  ProductData.swift
//  Baguni
//
//  Created by 윤영서 on 2021/05/25.
//

import Foundation

struct MyData: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
}

var mData = [
    MyData(title: "[델몬트] 바나나", subtitle: "4,300원"),
    MyData(title: "[다이슨] V6", subtitle: "464,650원"),
    MyData(title: "나무 그릇 세트", subtitle: "11,200원"),
    MyData(title: "[비비고] 왕교자", subtitle: "3,180원"),

]
