//
//  v2.swift
//  TushuDemo
//
//  Created by akke on 2019/1/6.
//  Copyright © 2019 akke. All rights reserved.
//

import UIKit
import Hero
class v2: UIViewController {
    @IBOutlet weak var gary: UIView!
    @IBOutlet weak var red: UIView!
    @IBOutlet weak var white: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        gary.hero.id = "gary"
        red.hero.id = "red"
        white.hero.modifiers = [.translate(y:100),.useGlobalCoordinateSpace]

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: UIButton) {
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
