//
//  ImageViewController.swift
//  LECP
//
//  Created by Luis Eduardo Cordova Pichardo on 13/01/23.
//

import UIKit
import SkeletonView

class ImageViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!

    var imageUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userImageView.isSkeletonable = true
        userImageView.showAnimatedGradientSkeleton()
        
        DispatchQueue.global().async {
            self.userImageView.loadFromUrl(url: URL(string: self.imageUrl)!)
        }
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
