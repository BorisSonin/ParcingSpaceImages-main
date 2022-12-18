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
    
    var astronomy: AstronomyPicture?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Astronomy Picture of the Day"
        descriptionButton.setTitle("Description", for: .normal)
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        parcingPictures()
    }
    
    @IBAction func buttonTapped() {
    }
    
    private func fetchImage() {
        NetworkManager.shared.fetchImage(from: astronomy?.url) { [weak self] imageData in
            self?.imageView.image = UIImage(data: imageData)
            self?.activityIndicator.stopAnimating()
        }
    }
    
    private func parcingPictures() {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let astronomy = try JSONDecoder().decode(AstronomyPicture.self, from: data)
                print(astronomy)
                self.astronomy = astronomy
                self.fetchImage()
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


