//
//  KillswitchAction.swift
//  
//
//  Created by Yannick Jacques on 2022-05-11.
//

import Foundation

public struct KillswitchAction {

    public let title: String
    public let url: URL?
    public let dismissOnClick: Bool

    public init?(_ title: String?, url: URL?, dismissOnClick: Bool?) {
        guard let title = title else {
            return nil
        }
        
        self.init(title: title, url: url, dismissOnClick: dismissOnClick ?? true)
    }
    
    public init(title: String, url: URL?, dismissOnClick: Bool = true) {
        self.url = url
        self.title = title
        self.dismissOnClick = dismissOnClick
    }
}
