//
//  ViewController_note_add.swift
//  日时记(with-coredata)
//
//  Created by 张晨阳 on 2020/6/25.
//  Copyright © 2020 Martin Zhang. All rights reserved.
//

import UIKit

class ViewController_note_add: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textview: UITextView!
    
    
    var row :Int32 = 1
    //var textViewHeight: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func save(_ sender: Any) {
        let notetext = note()
        notetext.text = self.textview.text
        notetext.date = Date()
        notetext.types = 1
        let dao = NotesDAO.sharedInstance
        dao.create(notetext)
        let reslist = dao.findAll()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let destination = sb.instantiateViewController(withIdentifier: "riji_root") as! UITabBarController
        self.present(destination, animated: true, completion: nil)
        
        
       
       // self.present(destination, animated: true, completion: nil)
        
        //self.present(destination, animated: true, completion: nil)
        //self.navigationController?.pushViewController(destination, animated: true)
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
   
        if text == "\n" {
            print(1)
            //self.textview.text.insert("2", at: self.textview.text.endIndex)
            self.addrow()
            return false
        }
        return true
    }
    
    func addrow(){
        self.row = self.row + 1
        let nsnumber = self.row as NSNumber
        let string:String = nsnumber.stringValue
        self.textview.text.insert("\n", at: self.textview.text.endIndex)
        self.textview.text.insert(contentsOf: string, at: self.textview.text.endIndex)
        self.textview.text.insert(".", at: self.textview.text.endIndex)
        
        //self.textview.text=self.textview.text.substring(to: self.textview.text.count - 1)
        
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
