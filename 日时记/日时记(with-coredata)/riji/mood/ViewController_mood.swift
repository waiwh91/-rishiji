//
//  ViewController_mood.swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 2019/1/25.
//  Copyright © 2019 Martin Zhang. All rights reserved.
//

import UIKit

class ViewController_mood: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{

    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var moodlabel: UILabel!
    
    
    var pickerData : NSDictionary!
    let moodarry = ["选择一个心情～","😊","😭","😂","🤔","😷","😡","😰","😱"]
    
    var rijitext = riji()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        moodlabel.text = "今天也是开心的一天呢！"
        
    }
    

    @IBAction func save(_ sender: Any) {
        
        if rijitext.mood == "" || rijitext.mood == "选择一个心情～" {
            let alert = UIAlertController(title: "确定？", message: "你真的不想选择一个心情嘛", preferredStyle: .alert)
            let noaction = UIAlertAction(title: "再想想", style: .cancel, handler: nil)
            let yesaction = UIAlertAction(title: "确定", style: .default, handler: {
                action in
                let dao = NoteDAO.sharedInstance
                dao.create(self.rijitext)
                
                let reslist = dao.findAll()
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let rijiroot = storyboard.instantiateViewController(withIdentifier: "riji_root") as! UITabBarController
                self.present(rijiroot, animated: true, completion: nil)
            })
            alert.addAction(noaction)
            alert.addAction(yesaction)
            self.present(alert, animated: true, completion: nil)
        }else{
            let dao = NoteDAO.sharedInstance
            dao.create(rijitext)
            
            let reslist = dao.findAll()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let rijiroot = storyboard.instantiateViewController(withIdentifier: "riji_root") as! UITabBarController
            self.present(rijiroot, animated: true, completion: nil)
        }
        
    }
    
   
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.moodarry.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
            return self.moodarry[row]as? String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        let mood = self.moodarry[row]
        
        switch mood {
        case "😊":
            moodlabel.text = "今天也是开心的一天呢！"
        case "😭":
            moodlabel.text = "别伤心啦，打开哔哩哔哩一起嗨啊"
        case "😂":
            moodlabel.text = "不行！！！你不可以这么不严肃！！！"
        case "🤔":
            moodlabel.text = "思考与不思考，这是一个问题"
        case "😷":
            moodlabel.text = "良药苦口利于病嘛"
        case "😡":
            moodlabel.text = "www.bilibili.com欢迎你"
        case "😰":
            moodlabel.text = "别再担心啦！都是浮云啦"
        case "😱":
            moodlabel.text = "打开日时记，贞子都会怕你！！！"
        default :
            moodlabel.text = ""
        }
        
        self.rijitext.mood = mood
        
        //self.moodlabel.text = mood
       // self.pickerView.reloadComponent(1)

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




