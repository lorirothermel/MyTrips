//
// Created for MyTrips
// by  Stewart Lynch on 2023-12-31
//


import SwiftUI
import MapKit



struct DestinationLocationsMapView: View {
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var visibleRegion: MKCoordinateRegion?
    
    
    
    
    var body: some View {
        
        Map(position: $cameraPosition) {
//            Marker("Moulin Rouge", coordinate: CLLocationCoordinate2D(latitude: 48.884134, longitude: 2.332196))
//            Marker("Moulin Rouge", coordinate: .moulinRouge)
//                        
//            Marker("Arc de Triomphe", systemImage: "star.fill", coordinate: .arcDeTriomphe)
//            
//            Marker(coordinate: .louvre) {
//                Label("Louvre", systemImage: "star.fill")
//            }  // Marker
//            .tint(.purple)
//            
//            Marker(coordinate: .eiffelTower) {
//                Label("Eiffel Tower", image: "eiffelTower")
//            }  // Marker
//            .tint(.green)
//            
//            Marker("Gare du Nord", monogram: Text("GN"), coordinate: .gareDuNord)
//                .tint(.yellow)
            
            // ------------------------------------------------------
            
            Annotation("Notre Dame", coordinate: .notreDame) {
                Image(systemName: "star")
                    .imageScale(.small)
                    .foregroundStyle(.red)
                    .padding(10)
                    .background(.white)
                    .clipShape(.circle)
            }  // Annotation
            
            Annotation("sacre Coeur", coordinate: .sacreCoeur, anchor: .center) {
                Image("sacreCoeur")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }  // Annotation
            
            Annotation("Pantheon", coordinate: .pantheon) {
                Image(systemName: "mappin")
                    .imageScale(.small)
                    .foregroundStyle(.red)
                    .padding(5)
                    .overlay {
                        Circle()
                            .strokeBorder(.red, lineWidth: 2)
                        
                    }   // .overlay
            }  // Annotation
            
            MapCircle(center: CLLocationCoordinate2D(latitude: 48.856788, longitude: 2.351077), radius: 5000)
                .foregroundStyle(.red.opacity(0.5))
            
        }  // Map
        
        .onMapCameraChange(frequency: .onEnd) { context in
            visibleRegion = context.region
        }  // .onMapCameraChange
        
        .onAppear {
            // Paris coordinates -> 48.856788 , 2.351077
            let paris = CLLocationCoordinate2D(latitude: 48.856788, longitude: 2.351077)
            let parisSpan = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
            let parisRegion = MKCoordinateRegion(center: paris, span: parisSpan)
            cameraPosition = .region(parisRegion)
        }  // .onAppear
    
        
        
    }  // some View
    
}  // DestinationLocationsMapView


#Preview {
    DestinationLocationsMapView()
}
