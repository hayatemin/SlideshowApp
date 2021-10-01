//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 横山颯 on 2021/09/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var SlideImage: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var SlideshowButton: UIButton!
    
    var indexnum:Int = 0
    var timer : Timer!
    
    var imageArray:[UIImage] = [
        
        UIImage(named: "1.jpeg")!,
        UIImage(named: "2.jpeg")!,
        UIImage(named: "3.jpeg")!,
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SlideImage.image = imageArray[indexnum]
        SlideImage.isUserInteractionEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if timer != nil{
            timer.invalidate() //timer停止
            timer = nil
            SlideshowButton.setTitle("再生", for: .normal)
            
            returnButton.isEnabled = true
            nextButton.isEnabled = true
        }
            
        let Zoomcontroller:ZoomViewController = segue.destination as! ZoomViewController
        Zoomcontroller.image = SlideImage.image!
        //UpImagecontroller.arrayNum = self.indexnum
    }
    
    @IBAction func NextButton(_ sender: Any) {
        //進むボタンの処理
        indexnum += 1
        if indexnum == imageArray.count{
            indexnum = 0
        }
        SlideImage.image = imageArray[indexnum]
    }
    
    @IBAction func ReturnButton(_ sender: Any) {
        //戻るボタンの処理
        indexnum -= 1
        if indexnum < 0{
            indexnum = imageArray.count-1
        }
        SlideImage.image = imageArray[indexnum]
    }
    
    @IBAction func startStopButton(_ sender: Any) {
        if timer == nil{
            //再生の処理
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self,selector: #selector(changeImage),userInfo: nil, repeats: true)
            SlideshowButton.setTitle("停止", for: .normal)
            
            returnButton.isEnabled = false
            nextButton.isEnabled = false
            
        }else{
            //停止の処理
            timer.invalidate() //timer停止
            timer = nil
            
            SlideshowButton.setTitle("再生", for: .normal)
            
            returnButton.isEnabled = true
            nextButton.isEnabled = true
            
        }
    }
    
    @objc func changeImage(){
        
        
        indexnum += 1
        if indexnum == imageArray.count{
            indexnum = 0
        }
        
        SlideImage.image = imageArray[indexnum]
        
    }
    
    @IBAction func returnUpImage(_ segue: UIStoryboardSegue){
        
    }
}
