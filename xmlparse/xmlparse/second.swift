//
//  second.swift
//  xmlparse
//
//  Created by TOPS on 7/19/18.
//  Copyright © 2018 dp. All rights reserved.
//

import UIKit

class second: UIViewController {

    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var web: UIWebView!
    var arr:[String] = [];
    
    @IBOutlet weak var lbltit: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let strurl = URL(string: arr[2])
        web.loadRequest(URLRequest.init(url: strurl!));
        textview.text = arr[1];
        lbltit.text = arr[0]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
