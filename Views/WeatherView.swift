//
//  WeatherView.swift
//  IOS Moushum App
//
//  Created by Md. Masum  on 9/2/22.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name).bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "sun.max").font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }.frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "*").font(.system(size: 80)).fontWeight(.bold).padding()
                    }
                    //Spacer()
                    
                    Image("city").resizable().aspectRatio(contentMode: .fit)
                    VStack{
                        Spacer()
                        VStack(alignment: .leading, spacing: 20){
                            Text("Weather Now").bold().padding(.bottom)
                            HStack{
                                WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "*"))
                                Spacer()
                                WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "*"))
                            }
                            HStack{
                                WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                                Spacer()
                                WeatherRow(logo: "humidity", name: "Humidity ", value: (weather.main.humidity.roundDouble() + "p"))
                            }
                        }.frame(maxWidth: .infinity,alignment: .leading).padding().padding(.bottom,20).foregroundColor(Color(hue: 0.69, saturation: 0.813, brightness: 0.352)).background(.white).cornerRadius(20, corners: [.topLeft, .topRight])
                    }
                }
            }.padding().frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }.edgesIgnoringSafeArea(.bottom).background(Color(hue: 0.69, saturation: 0.813, brightness: 0.352)).preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
