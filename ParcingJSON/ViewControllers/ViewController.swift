//
//  ViewController.swift
//  ParcingJSON
//
//  Created by Борис Сонин on 13.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var descriptionButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    let urlString = "https://go-apod.herokuapp.com/apod"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        parcingPictures()
        label.text = "Astronomy Picture of the Day"
        descriptionButton.setTitle("Get description", for: .normal)
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchImagee()
        
    }
    
    @IBAction func buttonTapped() {

    }
    
    private func fetchImagee() {
        NetworkManager.shared.fetchImage(from: urlString) { [weak self] imageData in
            self?.imageView.image = UIImage(data: imageData)
            self?.activityIndicator.stopAnimating()
        }
    }
    
//   private func parcingPictures() {
//
//        let urlString = "https://go-apod.herokuapp.com/apod"
//
//        guard let url = URL(string: urlString) else { return }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            do {
//                let astronomy = try JSONDecoder().decode(AstronomyPicture.self, from: data)
//                print(astronomy)
//            } catch let error {
//                print(error)
//            }
//        }.resume()
//    }
}


