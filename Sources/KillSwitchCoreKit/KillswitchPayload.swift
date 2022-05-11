//
//  KillswitchPayload.swift
//  KillSwitchCoreKit
//
//  Created by Yannick Jacques on 2022-05-10.
//

import Foundation

public enum KillswitchType: String, Codable {
    case blocking
    case fullscreen
    case modal
    case banner
    
    public static var `default`: KillswitchType { KillSwitchCoreKitConfiguration.shared.defaultKillSwitch ?? .fullscreen }
}

public struct KillswitchPayload {
    
    public let title: String
    public let body: String
    public let thumbnailUrl: URL?
    public let type: KillswitchType

    public let primaryAction: KillswitchAction?
    public let secondaryAction: KillswitchAction?

    public init(title: String, body: String, thumbnailUrl: URL? = nil, primaryAction: KillswitchAction?, secondaryAction: KillswitchAction? , type: KillswitchType = .default) {
        self.title = title
        self.body = body
        self.thumbnailUrl = thumbnailUrl
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
        self.type = type
    }
}

extension KillswitchPayload: Codable {

    private enum CodingKeys: String, CodingKey {
        case title
        case body
        case type
        case thumbnailUrl
        case primaryActionTitle
        case primaryActionUrl
        case primaryActionDismissOnClick
        case secondaryActionTitle
        case secondaryActionUrl
        case secondaryActionDismissOnClick
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.body = try container.decode(String.self, forKey: .body)
        self.thumbnailUrl = try container.decodeIfPresent(URL.self, forKey: .thumbnailUrl)
        self.type = try container.decodeIfPresent(KillswitchType.self, forKey: .type) ?? .default
        
        let primaryActionTitle = try container.decodeIfPresent(String.self, forKey: .primaryActionTitle)
        let primaryActionUrl = try container.decodeIfPresent(URL.self, forKey: .primaryActionUrl)
        let primaryActionDismissOnClick = try container.decodeIfPresent(Bool.self, forKey: .primaryActionDismissOnClick)
        
        self.primaryAction = KillswitchAction(primaryActionTitle, url: primaryActionUrl, dismissOnClick: primaryActionDismissOnClick)
        
        let secondaryActionTitle = try container.decodeIfPresent(String.self, forKey: .secondaryActionTitle)
        let secondaryActionUrl = try container.decodeIfPresent(URL.self, forKey: .secondaryActionUrl)
        let secondaryActionDismissOnClick = try container.decodeIfPresent(Bool.self, forKey: .secondaryActionDismissOnClick)
        
        self.secondaryAction = KillswitchAction(secondaryActionTitle, url: secondaryActionUrl, dismissOnClick: secondaryActionDismissOnClick)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(body, forKey: .body)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(thumbnailUrl, forKey: .thumbnailUrl)
        try container.encodeIfPresent(primaryAction?.title, forKey: .primaryActionTitle)
        try container.encodeIfPresent(primaryAction?.url, forKey: .primaryActionUrl)
        try container.encodeIfPresent(primaryAction?.dismissOnClick, forKey: .primaryActionDismissOnClick)
        try container.encodeIfPresent(secondaryAction?.title, forKey: .secondaryActionTitle)
        try container.encodeIfPresent(secondaryAction?.url, forKey: .secondaryActionUrl)
        try container.encodeIfPresent(secondaryAction?.dismissOnClick, forKey: .secondaryActionDismissOnClick)
    }
}
