//
//  Settings.swift
//  PongApp
//
//  Created by Lukas Koppelmann on 27.01.22.
//  Copyright © 2022 Archetapp. All rights reserved.
//

import UIKit
var x = 1;
class Settings: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var soundSwitcher: UISwitch!
    @IBAction func soundSwitch(_ sender: Any) {
        if soundSwitcher.isOn{
            x = 1;
        }else{
            x = 0;
        }
        print(x);
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
