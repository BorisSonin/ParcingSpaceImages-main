//
//  DescriptionViewController.swift
//  ParcingJSON
//
//  Created by Борис Сонин on 17.12.2022.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet var descriptionText: UITextView!
    @IBOutlet var titleDescription: UILabel!
    
    var astronomyText:AstronomyPicture?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parcingText()
    }
    
    private func parcingText() {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self]  data, response, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let astronomy = try JSONDecoder().decode(AstronomyPicture.self, from: data)
                print(astronomy)
                DispatchQueue.main.async {
                    self?.descriptionText.text = astronomy.explanation
                    self?.titleDescription.text = astronomy.title
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

