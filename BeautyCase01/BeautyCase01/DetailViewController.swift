//
//  DetailViewController.swift
//  BeautyCase01
//
//  Created by Amann, Antonino, Schlocker on 29.06.21.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var mhdTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mhd2TextField: UITextField!
    @IBOutlet weak var buyDateTextField: UITextField!
    
    var detailMakeUp: Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.text = detailMakeUp?.name
        descriptionTextField.text = detailMakeUp?.description
        mhdTextField.text = detailMakeUp?.mhd
        
        if let image = detailMakeUp?.imageName {
            imageView.image = UIImage(named: image)
        }
    }
}
