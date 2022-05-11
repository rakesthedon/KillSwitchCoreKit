import XCTest
@testable import KillSwitchCoreKit

final class KillSwitchKitTests: XCTestCase {
    
    func testKillswitchPayloadDecoding() {
        let payload: Data = """
        {
        "body": "This the body of my first killswitch, pretty cool right?",
        "title": "first killswitch",
        "type": "banner",
        "thumbnailUrl": "https://ichef.bbci.co.uk/news/976/cpsprodpb/C120/production/_104304494_mediaitem104304493.jpg"
        }
        """.data(using: .utf8)!
        
        XCTAssertNoThrow(try JSONDecoder().decode(KillswitchPayload.self, from: payload))
    }
}
