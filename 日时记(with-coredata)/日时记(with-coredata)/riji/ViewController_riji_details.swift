//
//  ViewController_riji_details.swift
//  日时记(with-coredata)
//
//  Created by Martin Zhang on 30/12/2018.
//  Copyright © 2018 Martin Zhang. All rights reserved.
//

import UIKit

class ViewController_riji_details: UIViewController {

    @IBOutlet weak var detaiview: UITextView!
    
   /* var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail: riji = self.detailItem as? riji {
            if let label = self.detaiview {
                label.text = detail.text
            }
        }
    }

    */
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.configureView()
        
    
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back_to_riji(_ sender: Any) {
        self.detaiview.resignFirstResponder()
        
        self.dismiss(animated: true, completion: nil)
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
