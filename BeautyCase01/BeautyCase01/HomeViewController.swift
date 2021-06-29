//
//  HomeViewController.swift
//  BeautyCase01
//
//  Created by Amann, Antonino, Schlocker on 28.06.21.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage


class HomeViewController: UIViewController {

    var model = ProductModel()
    var selectedProduct: ProductType?
   
    var ref: DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    var postData = [String]()
    
    @IBOutlet weak var productTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        productTableView.dataSource = self
    
        downloadImageFromStorage()
        
    }
    
    @IBAction func changeProductSelection(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex { //filtering at home screen
        case 0:
            selectedProduct = nil
        case 1:
            selectedProduct = .eyes
        case 2:
            selectedProduct = .face
        case 3:
            selectedProduct = .lips
        default:
            break
        }
        
        productTableView.reloadData()
    }
    
    
    func downloadImageFromStorage() {
        let storage = Storage.storage()
        var storageRef = storage.reference()
        
        // Tried to download one image from the firebase storage
        storageRef = storageRef.child("img/Bild1.jpg")
        
        let downloadTask = storageRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
            if let error = error {
            } else {
                let image = UIImage(data: data!) //could be later used in UIImageView
                
                print("image succesfully downloaded \(image!)")
            }
        }
        
        downloadTask.observe(.resume) { snapshot in
            // Observe for changes in download status
        }
        
        downloadTask.observe(.pause) { snapshot in
        }
        
        downloadTask.observe(.progress) { snapshot in
            let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount)
                / Double(snapshot.progress!.totalUnitCount)
        }
        
        downloadTask.observe(.success) { snapshot in
        }
        
        // if errors occur
        downloadTask.observe(.failure) { snapshot in
            guard let errorCode = (snapshot.error as? NSError)?.code else {
                return
            }
            guard let error = StorageErrorCode(rawValue: errorCode) else {
                return
            }
            switch (error) {
            case .objectNotFound:
                break
            case .unauthorized:
                break
            case .cancelled:
                break
            case .unknown:
                break
            default:
                break
            }
        }
    }
    

}
//Navigate to DetailView

extension HomeViewController {
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let selectedCell = sender as! UITableViewCell
    let selectedIndexPath = productTableView.indexPath(for: selectedCell)
    
    let detailView = segue.destination as! DetailViewController
    detailView.detailMakeUp = model.products(forType: selectedProduct)[selectedIndexPath!.row]
}
}
    
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.products(forType: selectedProduct).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BlingCell", for: indexPath)
        
        let product = model.products(forType: selectedProduct)[indexPath.row]
        
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = product.description
        cell.imageView?.image = UIImage(named: product.thumbName)
        
        return cell
    }
    
}


