//
//  ViewController.swift
//  Elements
//
//  Created by Alex Paul on 12/31/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ElementsViewController: UIViewController {
    
    private var resultElement = [Elements.ElementInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
    }

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
    super.viewDidLoad()
        title = "Elements"
         myTableView.dataSource = self
        myTableView.delegate = self
        giveUsTheData()
        
   
  }
    
    private func giveUsTheData() {
        ElementAPIClient.getData { (error, data) in
            if let error = error {
                print(error.errorMessage())
            } else if let data = data {
                self.resultElement = data
            }
        }
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     guard let indexPath = myTableView.indexPathForSelectedRow,
            let dataToSet = segue.destination as? DetailedViewController else {
                fatalError("IndexPath, detailVc nil")
        }
        let localElement = resultElement[indexPath.row]
       dataToSet.currentElement = localElement
    }

}

extension ElementsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return resultElement.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let theElement = resultElement[indexPath.row]
       var resultCell = UITableViewCell()
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "ElementCell", for: indexPath) as? CustomCell else {fatalError("Cell not found")}
        cell.label1.text = theElement.name
        cell.label2.text = ("\(theElement.symbol!)(\(theElement.number))  \(theElement.atomic_mass)")
      var  doubleKey = String()
        var imageNumber: Int
        imageNumber = theElement.number
        if imageNumber < 10 {
            doubleKey = "00\(theElement.number)"
        } else if imageNumber >= 10 && imageNumber < 100 {
            doubleKey = "0\(imageNumber)"
        }
        if let image = ImageHelper.shared.image(forKey: "http://www.theodoregray.com/periodictable/Tiles/\(doubleKey)/s7.JPG" as NSString) {
            cell.elementImage.image = image
    } else {
    ImageHelper.shared.fetchImage(urlString: "http://www.theodoregray.com/periodictable/Tiles/\(doubleKey)/s7.JPG") { (appError, image) in
    if let appError = appError {
    print(appError.errorMessage())
    } else if let image = image {
    cell.elementImage.image = image
    }
    }
    }
       resultCell = cell
        return resultCell
    }
    
    
}

extension ElementsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
        
    }
}

