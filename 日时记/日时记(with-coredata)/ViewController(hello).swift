//
//  ViewController.swift
//  日时记
//
//  Created by Martin Zhang on 2018/10/26.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 640, height: 1136))
        let pic = UIImageView(image: UIImage(named: "background"))
        view.addSubview(pic)
        view.addSubview(v)
        view.sendSubviewToBack(v)
        view.sendSubviewToBack(pic)
    }
 
    
    
   
    
   
    
    
    
    
    }


