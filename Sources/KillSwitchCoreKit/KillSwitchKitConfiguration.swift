//
//  KillSwitchCoreKitConfiguration.swift
//  KillSwitchCoreKit
//
//  Created by Yannick Jacques on 2022-05-10.
//

import Foundation

public final class KillSwitchCoreKitConfiguration {
    
    public var defaultKillSwitch: KillswitchType?
    
    public static let shared = KillSwitchCoreKitConfiguration()
    
    private init() {}
}
