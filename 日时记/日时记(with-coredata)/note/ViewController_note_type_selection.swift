//
//  ViewController_note_type_selection.swift
//  日时记(with-coredata)
//
//  Created by 张晨阳 on 2020/6/25.
//  Copyright © 2020 Martin Zhang. All rights reserved.
//

import UIKit

class ViewController_note_type_selection:  UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var picker: UIPickerView!
    var selected_types :String = ""
    let pickerData : NSDictionary! = nil
    let typeData = ["空便签","待办事项","提醒事项"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func next(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
         print("23333")
         print(self.selected_types)
         if self.selected_types == "空便签"  {
             let destination = sb.instantiateViewController(withIdentifier: "note_empty") as! UIViewController
             self.present(destination, animated: true, completion: nil)
         }
        if self.selected_types == ""  {
            let destination = sb.instantiateViewController(withIdentifier: "note_empty") as! UIViewController
            self.present(destination, animated: true, completion: nil)
        }
         if self.selected_types == "待办事项" {
             let destination = sb.instantiateViewController(withIdentifier: "note_todo") as! UIViewController
             self.present(destination, animated: true, completion: nil)
         }
         if self.selected_types == "提醒事项" {
             let destination = sb.instantiateViewController(withIdentifier: "note_reminds") as! UIViewController
             self.present(destination, animated: true, completion: nil)
         }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.typeData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.typeData[row]as? String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let type_selected = self.typeData[row]
        print(type_selected)
        self.selected_types = type_selected
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
