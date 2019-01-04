//
//  DetailedViewController.swift
//  Elements
//
//  Created by Olimpia on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    var currentElement: Elements.ElementInfo!
    var currentFaveElement: Favorites!
    
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    @IBOutlet weak var imageLink: UIImageView!
    @IBOutlet weak var cornerNumer: UILabel!
    @IBOutlet weak var bigLetter: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var doubleLabel: UILabel!
   
    @IBOutlet weak var discoverd: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cornerNumer.text = ("\(currentElement.number)")
        title = currentElement.name
        bigLetter.text = currentElement.symbol
        nameLabel.text = currentElement.name
        doubleLabel.text = ("\(currentElement.boil!)")
        discoverd.text = ("Discovered by \(currentElement.discovered_by!)")
    
       
    
    }
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
   
    @IBAction func favoriteAction(_ sender: Any) {
        let favorite = Favorites.init(favoritedBy: "Olimpia Compean", elementName: currentElement.name!, elementSymbol: currentElement.symbol!)
//        do {
//            let data = try JSONEncoder().encode(favorite)
//            ElementAPIClient.init() { (appError, success) in
//                if let appError = appError {
//                    DispatchQueue.main.async {
//                        self.showAlert(title: "Error Message", message: appError.errorMessage())
//                    }
//                } else if success {
//                    DispatchQueue.main.async {
//                        self.showAlert(title: "successfully favorited podcast", message: "")
//                    }
//                } else {
//                    DispatchQueue.main.async {
//                        self.showAlert(title: "was not favorited", message: "")
//                    }
//                }
//            }
//        } catch {
//            print("encoding error: \(error)")
//        }
    
}

}

   





