//
//  booksub.swift
//  TushuDemo
//
//  Created by akke on 2018/12/31.
//  Copyright © 2018 akke. All rights reserved.
//

import UIKit

class booksub: UIViewController {
var bkimage = ""
    @IBOutlet weak var bookimage: UIImageView!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        print(bkimage)
        let imaurl = URL(string: bkimage)
        bookimage.kf.setImage(with: imaurl)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func b(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
