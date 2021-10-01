//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 横山颯 on 2021/10/01.
//

import UIKit

class ZoomViewController: UIViewController {
    @IBOutlet weak var upImage: UIImageView!
    
    var arrayNum:Int = 0
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upImage.image = image
        
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
