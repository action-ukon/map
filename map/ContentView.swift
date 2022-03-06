//
//  ContentView.swift
//  map
//
//  Created by 坪田和樹 on 2022/03/06.
//

import SwiftUI
import MapKit

struct Spot: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct ContentView: View {
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 35.6805702,
            longitude: 139.7676359
        ),
        latitudinalMeters: 1000.0,
        longitudinalMeters: 1000.0
    )
    
    let spotlist = [
        Spot(name: "おれんち", latitude: 35.6834843, longitude: 139.7644207),
    ]
    
    var body: some View {
        Map(coordinateRegion: $region,
        annotationItems: spotlist,
            annotationContent: {spot in
                MapAnnotation(coordinate: spot.coordinate,
                          anchorPoint: CGPoint(x: 0.5, y: 0.5),
                          content: {
                            Image(systemName:  "house.fill").foregroundColor(.red)
                            Text(spot.name).italic()
                          }
                )}
        )
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
