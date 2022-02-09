//
//  WelcomeView.swift
//  IOS Moushum App
//
//  Created by Md. Masum  on 9/2/22.
//
import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to the IOS Moushum App").bold().font(.title)
                
                Text("Please share your current location to get weather update of your area").padding()
            }.multilineTextAlignment(.center).padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }.cornerRadius(30).foregroundColor(.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
