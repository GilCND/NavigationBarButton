//
//  DetailsViewController.swift
//  ImagesWithFileManager
//
//  Created by Felipe Gil on 2021-05-25.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    var nameOfImage: String?
    var numberOfImage: Int = 0
    var numberOfImages: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(numberOfImage) of \(numberOfImages)"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = nameOfImage {
            imgView.image = UIImage (named: imageToLoad)
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imgView.image?.jpegData(compressionQuality: 0.8), let imageName = nameOfImage else {
            print ("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present (vc, animated: true)
    }
}
