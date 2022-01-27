//
//  MenuVC.swift
//  Pong2
//
//  Created by Jared Davidson on 1/9/17.
//  Copyright © 2017 Archetapp. All rights reserved.
//

import Foundation
import UIKit

enum gameType {
    case easy
    case medium
    case hard
    case player2
}

class MenuVC : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        version.text = "PongApp v." + getVersion()
    }
    @IBOutlet weak var version: UILabel!
    
    @IBAction func Player2(_ sender: Any) {
        moveToGame(game: .player2)
    }
    
    @IBAction func Easy(_ sender: Any) {
        moveToGame(game: .easy)
    }
    @IBAction func Medium(_ sender: Any) {
        moveToGame(game: .medium)
        
    }
    @IBAction func Hard(_ sender: Any) {
        moveToGame(game: .hard)
    }
    func getVersion() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        return "\(version) build \(build)"
    }
    
    func moveToGame(game : gameType) {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = game

        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    @IBAction func exit(_ sender: Any) {
        let menue = self.storyboard?.instantiateViewController(withIdentifier: "menue") as! UIViewController
        self.navigationController?.pushViewController(menue, animated: true)
    }
    @IBAction func buttonTapped(_ sender: Any) {
            let vc = UIViewController()
            vc.modalPresentationStyle = .formSheet
            vc.preferredContentSize = .init(width: 500, height: 800)
            present(vc, animated: true)
    }
}
