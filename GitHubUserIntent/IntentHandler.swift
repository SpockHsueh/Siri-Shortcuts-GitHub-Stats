//
//  IntentHandler.swift
//  GitHubUserIntent
//
//  Created by Spock on 2019/4/8.
//  Copyright © 2019 Spock. All rights reserved.
//

import Intents
import GitHubFetcher

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        guard intent is CheckMyGitHubIntent else {
            fatalError("Unhandled intent type: \(intent)")
        }
        
        return CheckMyGitHubIntentHandler()
    }
    
}
