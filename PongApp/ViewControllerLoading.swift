//
//  ViewControllerLoading.swift
//  PongApp
//
//  Created by Lukas Koppelmann on 27.01.22.
//  Copyright © 2022 Archetapp. All rights reserved.
//

import UIKit

class ViewControllerLoading: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        version.text = "PongApp v." + getVersion()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var version: UILabel!
    func getVersion() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        return "\(version) build \(build)"
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
