//
//  ViewController.swift
//  Weather10
//
//  Created by Наталья Чушкина on 09.11.2019.
//  Copyright © 2019 Наталья Чушкина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var main: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
             descriptionLabel.text = "Default Text"  
        }
    }
    
    
    @IBOutlet weak var sun: UIImageView!
    @IBOutlet weak var cloud: UIImageView!
    @IBOutlet weak var rain: UIImageView!
    @IBOutlet weak var snow: UIImageView!
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.setTitle(NSLocalizedString("button.title", comment: ""), for: .normal)
            button.layer.cornerRadius = 10
            button.backgroundColor = .orange
            button.setTitleColor(.white, for: .normal)
        
                }
    }
    
    @IBAction private func buttonWasTapped (){
        //print(#function) //стандартный макрос
        
        switch descriptionLabel.text {
        case "Default Text":
            descriptionLabel.text = "Солнечно"
            UIView.animate(withDuration: TimeInterval(0.9), animations: {
                self.sun.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
            }) { _ in
                UIView.animate(withDuration: TimeInterval(0.9)) {
                    self.sun.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            }
        case "Солнечно":
            descriptionLabel.text = "Облачно"
            UIView.animate(withDuration: TimeInterval(FP_INFINITE), animations: {
                self.cloud.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
            }) { _ in
                UIView.animate(withDuration: TimeInterval(FP_INFINITE)) {
                    self.cloud.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            }
            
        case "Облачно":
            descriptionLabel.text = "Дождь"
            UIView.animate(withDuration: TimeInterval(FP_INFINITE), animations: {
                self.rain.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
            }) { _ in
                UIView.animate(withDuration: TimeInterval(FP_INFINITE)) {
                    self.rain.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            }
            
        case "Дождь":
            descriptionLabel.text = "Снег"
            UIView.animate(withDuration: TimeInterval(FP_INFINITE), animations: {
                self.snow.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
            }) { _ in
                UIView.animate(withDuration: TimeInterval(FP_INFINITE)) {
                    self.snow.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            }
            
        case "Снег":
            descriptionLabel.text = "Солнечно"
            UIView.animate(withDuration: TimeInterval(FP_INFINITE), animations: {
                self.sun.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
            }) { _ in
                UIView.animate(withDuration: TimeInterval(FP_INFINITE)) {
                    self.sun.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            }
        default:
            descriptionLabel.text = "Default Text"
           
        }
        
       
        Net().requestWeather {
            model in self.model = model
        }
        
//        //или
//        Net().requestWeather(callback: {
//            model in self.model = model
//
//            })
//    
//       //или
//        Net().requestWeather {
//            self.model = $0
//        }

        
    }
    
    private var model: Model? {
        didSet {
            guard let model = model else {return}
            city.text = "Add city"
            latitude.text = "\(model.coordinate.latitude)"
            longitude.text = "\(model.coordinate.longitude)"
            
            if let weather = model.weather.first {
                main.text = weather.main
                descriptionLabel.text = weather.descriptionString
            }

        }
    }

    override func viewDidLoad() { //метод срабатывает, когда вью уже загружен
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


   
}

