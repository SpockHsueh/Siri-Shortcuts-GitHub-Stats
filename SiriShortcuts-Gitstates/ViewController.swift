//
//  ViewController.swift
//  SiriShortcuts-Gitstates
//
//  Created by Spock on 2019/4/7.
//  Copyright © 2019 Spock. All rights reserved.
//

import UIKit
import GitHubFetcher
import Intents

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func findUser(_ sender: Any) {
        guard let name = textField.text, name.count > 0 else {
            return
        }
        
        Fetcher.fetch(name: name) { (user) in
            INPreferences.requestSiriAuthorization { (status) in
                switch status {
                case .authorized:
                    self.donate(name: name)
                default:
                    print("Not granted")
                    break
                }
            }
        }
    }
    
    private func donate(name: String) {
        let intent = CheckMyGitHubIntent()
        intent.suggestedInvocationPhrase = "Check my GitHub from ViewController"
        intent.name = name
        
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate { (error) in
            if error != nil {
                if let error = error as NSError? {
                    print("Interaction donation failed: \(error.description)")
                } else {
                    print("Successfully donated interaction")
                }
            }
        }
    }
    
}

