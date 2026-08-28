import SwiftUI
import XCTest
@testable import DesignKit

final class ColorHexTests: XCTestCase {
    private func components(_ color: Color) -> (Double, Double, Double)? {
        #if canImport(UIKit)
        let uiColor = UIColor(color)
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        guard uiColor.getRed(&r, green: &g, blue: &b, alpha: &a) else { return nil }
        return (Double(r), Double(g), Double(b))
        #elseif canImport(AppKit)
        let nsColor = NSColor(color).usingColorSpace(.deviceRGB)
        guard let nsColor else { return nil }
        return (Double(nsColor.redComponent), Double(nsColor.greenComponent), Double(nsColor.blueComponent))
        #else
        return nil
        #endif
    }

    func testHexWithHashPrefix() {
        let color = Color(hex: "#FF0000")
        guard let (r, g, b) = components(color) else { return XCTFail("failed to extract components") }
        XCTAssertEqual(r, 1.0, accuracy: 0.01)
        XCTAssertEqual(g, 0.0, accuracy: 0.01)
        XCTAssertEqual(b, 0.0, accuracy: 0.01)
    }

    func testHexWithoutHashPrefix() {
        let color = Color(hex: "00FF00")
        guard let (r, g, b) = components(color) else { return XCTFail("failed to extract components") }
        XCTAssertEqual(r, 0.0, accuracy: 0.01)
        XCTAssertEqual(g, 1.0, accuracy: 0.01)
        XCTAssertEqual(b, 0.0, accuracy: 0.01)
    }

    func testHexBlue() {
        let color = Color(hex: "#0000FF")
        guard let (r, g, b) = components(color) else { return XCTFail("failed to extract components") }
        XCTAssertEqual(r, 0.0, accuracy: 0.01)
        XCTAssertEqual(g, 0.0, accuracy: 0.01)
        XCTAssertEqual(b, 1.0, accuracy: 0.01)
    }

    func testInvalidHexFallsBackToGray() {
        let color = Color(hex: "not-a-color")
        XCTAssertEqual(color, Color.gray)
    }

    func testWrongLengthFallsBackToGray() {
        let color = Color(hex: "#FFF")
        XCTAssertEqual(color, Color.gray)
    }
}
