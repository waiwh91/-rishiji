//
//  ViewController_note_details.swift
//  日时记
//
//  Created by 张晨阳 on 2020/6/27.
//  Copyright © 2020 Martin Zhang. All rights reserved.
//

import UIKit

class ViewController_note_details: UIViewController,UITextViewDelegate {

    var notetext = note()
    
    @IBOutlet weak var textview: UITextView!
    
    @IBOutlet weak var nicky: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textview.text = self.notetext.text
                       
                       let dateFormate = DateFormatter()
                       dateFormate.dateFormat = "yyyy-MM-dd"
               let date = dateFormate.string(from: self.notetext.date as Date)
                       self.navigationItem.title = date
       // print("wdnmddd")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
        }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


