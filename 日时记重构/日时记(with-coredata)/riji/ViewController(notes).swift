//
//  ViewController(notes).swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 2018/11/10.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//

import UIKit
import CoreData

class ViewController_notes_: UIViewController,UITextFieldDelegate,UITextViewDelegate{
    
    
    
    
    @IBOutlet weak var textview: UITextView!
    

    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.textview.delegate = self
        //self.textview.becomeFirstResponder()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n"){
            print("textview获得焦点，点击return键")
            
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    @IBAction func save(_ sender: Any) {
        let note = riji()
        note.text = self.textview.text
        note.date = NSDate()
        let dao = NoteDAO.sharedInstance
        dao.create(note)
        
        self.textview.resignFirstResponder()
        
        let reslist = dao.findAll()
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: "reloadViewNotification"), object: reslist, userInfo: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
 
    
    
    
    /*@IBAction func save(_ sender: Any) {
        let note = riji()
        note.text = self.textview.text
        note.date = NSDate()
        let dao = NoteDAO.sharedInstance
        dao.create(note)
        
        */
    }
        

        

    
    
        
    
    
    
    

    
    
    
    
            

 
        // Do any additional setup after loading the view.

    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


