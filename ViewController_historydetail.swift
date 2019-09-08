//
//  ViewController_historydetail.swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 2019/5/12.
//  Copyright © 2019 Martin Zhang. All rights reserved.
//

import UIKit

class ViewController_historydetail: UIViewController {
    

    @IBOutlet weak var text: UITextView!
    
    @IBOutlet weak var bgp: UIImageView!
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true);
    }
    func configureView(){
        if let detail: riji = self.detailItem as? riji {
            //if let textview = self.detailview {
                text.text = detail.text
                let dateFormate = DateFormatter()
                dateFormate.dateFormat = "yyyy-MM-dd"
                let date = dateFormate.string(from: detail.date as Date)
                self.navigationItem.title = date
                //self.moodlabel.text = detail.mood
            //}
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
