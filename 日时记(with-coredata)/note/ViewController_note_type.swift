//
//  ViewController_note_type.swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 2019/9/28.
//  Copyright © 2019 Martin Zhang. All rights reserved.
//

import UIKit

class ViewController_note_type: UIViewController {
    
    let notetypearry = ["空便签","待办事项","事件记录"]

    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var cancel: UIBarButtonItem!
    
    
    @IBOutlet weak var yes: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func numberOfComponents(in picker: UIPickerView) -> Int {
        return 1
    }
    
    func picker(_ picker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.notetypearry.count
    }
    
    func picker(_ picker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return self.notetypearry[row]as? String
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
