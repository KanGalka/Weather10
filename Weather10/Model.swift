//
//  Model.swift
//  Weather10
//
//  Created by Наталья Чушкина on 09.11.2019.
//  Copyright © 2019 Наталья Чушкина. All rights reserved.
//

import Foundation

struct Model: Codable {
    var coordinate: Coordinate
    var weather: [Weather]
    var main: Main
    var wind: Wind
    
    
    enum CodingKeys: String, CodingKey {
        case coordinate = "coord" //краткие слова в кавычках берем из API
        case weather = "weather"
        case main = "main"
        case wind = "wind"
    }
}


//составляющие модели
struct Coordinate: Codable {
    var longitude: Double
    var latitude: Double
    
    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
    
}

struct Weather: Codable {
    var main: String
    var descriptionString: String
    
    enum CodingKeys: String, CodingKey {
        case main = "main"
        case descriptionString = "description"
    }
}


struct Main : Codable {
    var temp: Double
    var pressue: Int
    var humidity: Int
    var tempMin: Double
    var tepmMax:Double
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case pressue = "pressue"
        case humidity = "humidity"
        case tempMin = "tempMin"
        case tepmMax = "tepmMax"
    }
}

struct Wind: Codable {
    var speed: Double
    var deg: Double
    
    enum CodingKeys: String, CodingKey {
       case speed = "speed"
       case deg = "deg"
    }
}
