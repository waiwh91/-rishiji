//
//  ViewController_riji_details.swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 30/12/2018.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//

import UIKit

class ViewController_riji_details: UIViewController {

    @IBOutlet weak var detailview: UITextView!
    
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    @IBAction func back_to_riji(_ sender: Any) {
        self.detailview.resignFirstResponder()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail: riji = self.detailItem as? riji {
            if let textview = self.detailview {
                textview.text = detail.text
                let dateFormate = DateFormatter()
                dateFormate.dateFormat = "yyyy/MM/dd"
                let date = dateFormate.string(from: detail.date as Date)
                self.navigationItem.title = date
                
             }
        }
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()

        
        
        // Do any additional setup after loading the view.
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
