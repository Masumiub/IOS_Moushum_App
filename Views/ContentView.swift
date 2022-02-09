//
//  ContentView.swift
//  IOS Moushum App
//
//  Created by Md. Masum  on 9/2/22.
//
import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack{
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                    //Text("Weather data fetch")
                } else {
                    LoadingView().task{
                        do {
                            try await weather = weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                        } catch{
                            print("Error getting weather\(error)")
                        }
                    }
                }
                /*Text("Your coordinates are: \(location.longitude) \(location.latitude)")*/
            } else {
                if locationManager.isLoading{
                    LoadingView()
                }
                else{
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }.background(Color(hue: 0.69, saturation: 0.813, brightness: 0.352)).preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
