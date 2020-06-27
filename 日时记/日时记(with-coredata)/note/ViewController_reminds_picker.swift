//
//  ViewController_reminds_picker.swift
//  日时记
//
//  Created by 张晨阳 on 2020/6/27.
//  Copyright © 2020 Martin Zhang. All rights reserved.
//

import UIKit

class ViewController_reminds_picker: UIViewController  {

    @IBOutlet weak var date_picker: UIDatePicker!
    var notetext = note()
    var picker_temp : Int32 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.date_picker.datePickerMode = .time
        self.date_picker.locale = Locale.init(identifier: "zh_CN")
        self.date_picker.timeZone = TimeZone.current
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func change_mode(_ sender: Any) {
        print(self.date_picker.date)
        if self.picker_temp == 0 {
            self.date_picker.datePickerMode = .countDownTimer
            self.picker_temp = 1
        }else{
            self.date_picker.datePickerMode = .time
            self.picker_temp = 0
        }
        
    }
    
    @IBAction func save(_ sender: Any) {
        self.notetext.types = 3
        self.notetext.date = self.date_picker.date
        let dao = NotesDAO.sharedInstance
        dao.create(self.notetext)
        
        
        //设立倒计时
        let calendar = NSCalendar.current
        let datecomponent = calendar.dateComponents(in: TimeZone.current, from: Date())
        let daynow = datecomponent.day!
        let hournow = datecomponent.hour!
        let minutenow = datecomponent.minute!
        let secondnow = datecomponent.second!
        
        
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd-HH-mm-ss"
        let datestring = dateformatter.string(from: notetext.date as Date)
        print(datestring)
        
        let index1 = datestring.index(datestring.startIndex, offsetBy: 0)
        let index2 = datestring.index(datestring.startIndex, offsetBy: 2)
        
        let targetdaystring = datestring[index1..<index2]
        let targetdayint = (targetdaystring as NSString).intValue
        
        let index3 = datestring.index(datestring.startIndex, offsetBy: 3)
        let index4 = datestring.index(datestring.startIndex, offsetBy: 5)
        let targethourstring = datestring[index3..<index4]
        let targethourint = (targethourstring as NSString).intValue
        
        let index5 = datestring.index(datestring.startIndex, offsetBy: 6)
        let index6 = datestring.index(datestring.startIndex, offsetBy: 8)
        let targetminutestring = datestring[index5..<index6]
        let targetminuteint = (targetminutestring as NSString).intValue
        
        let index7 = datestring.index(datestring.startIndex, offsetBy: 9)
        let index8 = datestring.index(datestring.startIndex, offsetBy: 11)
        let targetsecondstring = datestring[index7..<index8]
        let targetsecondint = (targetsecondstring as NSString).intValue
        
        //调试用
        print(targetdayint)
        print("\n")
        print(targetdayint)
        print("\n")
        print(targethourstring)
        print("\n")
        print(targetsecondint)
        
        var total : Int = 10000000000
        
        if self.picker_temp == 0{
            let day = (Int(targetdayint)-daynow) * 86400
            let hour = (Int(targethourint) - hournow ) * 3600
            let minute = (  Int(targetminuteint) - minutenow) * 60
            let second = (Int(targetsecondint) - secondnow )
            total = day+hour+minute+second
        }
        
        if self.picker_temp == 1{
            if targethourint == 0 || targetminuteint == 0 {
                total = 60
            }else{
                let hour = (Int(targethourint)) * 3600
                let minute = (Int(targetminuteint)) * 60
                let second = Int(targetsecondint)
                total = hour+minute            }
            
        }
        
        
      
        
        let datess = Date()
        let datesstring = dateformatter.string(from: datess as Date)
        
        startimer(seconds: Int32(total),text:self.notetext.text,date: datesstring)
        
        
        
        
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let destination = sb.instantiateViewController(withIdentifier: "riji_root")
        self.present(destination, animated: true, completion: nil)
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
