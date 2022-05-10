//
//  KillSwitchKitConfiguration.swift
//  
//
//  Created by Yannick Jacques on 2022-05-10.
//

import Foundation

public final class KillSwitchKitConfiguration {
    
    public var defaultKillSwitch: KillswitchType?
    
    public static let shared = KillSwitchKitConfiguration()
    
    private init() {}
}
