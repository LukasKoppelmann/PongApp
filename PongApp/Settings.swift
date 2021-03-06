//
//  Settings.swift
//  PongApp
//
//  Created by Lukas Koppelmann on 27.01.22.
//  Copyright © 2022 Archetapp. All rights reserved.
//

import UIKit
class Settings: UIViewController {
    //Var
    var menuVC: MenuVC?
    var soundSetting = 1;
    //-----
    override func viewDidLoad() {
        super.viewDidLoad()
       let soundSetting = loadInt(desName: "soundOn")
        if soundSetting == 1{
            soundSwitcher.setOn(true, animated: false)
            soundSwitcher.isOn = true
        }else{
            soundSwitcher.setOn(false, animated: false)
            soundSwitcher.isOn = false
        }

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var soundSwitcher: UISwitch!
    @IBAction func soundSwitch(_ sender: Any) {
        if soundSwitcher.isOn{
            soundSetting = 1;
            saveInt(nameSafe: soundSetting, desName: "soundOn")
        }else{
            soundSetting = 0;
            saveInt(nameSafe: soundSetting, desName: "soundOn")
        }
        print(soundSetting);
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backToMenu"{
            let dest = segue.destination as! MenuVC
            dest.sound = soundSetting
            dest.Settings = self
        }
    }
    //load values
    func  loadInt(desName: String) -> Int{
        let defaults = UserDefaults.standard
        if let savedValue = defaults.object(forKey: desName) as? Int{
            print("Loaded '\(savedValue)'")
            return savedValue
        }
        return 1
    }
    
    //save values
    func saveInt(nameSafe: Int, desName: String){
        let saveValue = nameSafe
        let defaults = UserDefaults.standard
        defaults.set(saveValue, forKey: desName)
        print("Saved '\(saveValue)'")
    }
}
