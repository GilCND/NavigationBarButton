//
//  ViewController.swift
//  ImagesWithFileManager
//
//  Created by Felipe Gil on 2021-05-25.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let fm = FileManager.default
        //Here is ok to force unwrapping because if you does not have it, the app will not work at all
        // It's safe to use it
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasPrefix("fsg") {
                pictures.append(item)
            }
        }
        pictures.sort()
        print (pictures)
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailsViewController {
            vc.nameOfImage = pictures[indexPath.row]
            vc.numberOfImages = pictures.count
            vc.numberOfImage = indexPath.row + 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
