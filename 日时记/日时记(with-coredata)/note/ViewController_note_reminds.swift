//
//  ViewController_note_reminds.swift
//  日时记(with-coredata)
//
//  Created by 张晨阳 on 2020/6/26.
//  Copyright © 2020 Martin Zhang. All rights reserved.
//

import UIKit

class ViewController_note_reminds: UIViewController , UITextViewDelegate{

    var timepicker : ViewController_reminds_picker? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func next(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reminds_time"{
            let notes = note()
            notes.text = self.textView.text
            let controller = (segue.destination as! UINavigationController).topViewController as! ViewController_reminds_picker
            controller.notetext.text = notes.text
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

}
