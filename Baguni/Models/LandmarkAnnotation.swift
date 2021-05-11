//
//  LandmarkAnnotation.swift
//  Baguni
//
//  Created by 윤영서 on 2021/05/12.
//

import MapKit
import UIKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D

    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
