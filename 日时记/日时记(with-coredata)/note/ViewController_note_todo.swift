//
//  ViewController_note_todo.swift
//  日时记(with-coredata)
//
//  Created by 张晨阳 on 2020/6/26.
//  Copyright © 2020 Martin Zhang. All rights reserved.
//

import UIKit

class ViewController_note_todo: UIViewController , UITextViewDelegate {
    
    var buttonheight : Int = 94
    var buttontemp : Int32 = 0
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func tap(_ sender: Any) {
        if self.buttontemp == 0{
            self.button.setImage(UIImage(named: "gou.png"), for: UIControl.State())
            self.buttontemp = 1
        }else{
            self.button.setImage(UIImage(named: "yuanxingxuankuang.png"), for: UIControl.State())
            self.buttontemp = 0
        }
        
        
    }
    @IBAction func save(_ sender: Any) {
        let notetext = note()
        notetext.text = self.textView.text
        notetext.date = Date()
        notetext.types = 2
        let dao = NotesDAO.sharedInstance
        dao.create(notetext)
        let reslist = dao.findAll()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let destination = sb.instantiateViewController(withIdentifier: "riji_root") as! UITabBarController
        self.present(destination, animated: true, completion: nil)
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            let button = UIButton()
            let image = UIImage(named: "yuanxingxuankuang.png") as? UIImage
            button.setImage(image, for: UIControl.State())
            let tempheight = self.buttonheight
            self.buttonheight = tempheight+26
            button.frame = CGRect(x: 25, y: self.buttonheight, width: 25, height: 25)
            self.view.addSubview(button)
        }
        return true
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
