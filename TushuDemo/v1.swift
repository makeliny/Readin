//
//  v1.swift
//  TushuDemo
//
//  Created by akke on 2019/1/6.
//  Copyright © 2019 akke. All rights reserved.
//

import UIKit
import Hero
class v1: UIViewController {
    @IBOutlet weak var gary: UIView!
    
    @IBOutlet weak var red: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        gary.hero.id = "gary"
        red.hero.id = "red"

        // Do any additional setup after loading the view.
    }
    
 
    
    /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
