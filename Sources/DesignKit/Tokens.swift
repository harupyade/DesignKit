import SwiftUI

public enum Radius {
    /// カード・シート・大きめの面
    public static let card: CGFloat = 12
    /// ボタン・入力欄・チップ
    public static let control: CGFloat = 10
    /// タグ・バッジなど小要素
    public static let small: CGFloat = 6
}

public enum Spacing {
    public static let xs: CGFloat = 4
    public static let s: CGFloat = 8
    public static let m: CGFloat = 16
    public static let l: CGFloat = 24
    public static let xl: CGFloat = 32
}

public extension Font {
    /// 画面内の大きな数字表示（金額・カウンター）
    static var displayNumber: Font { .system(size: 44, weight: .bold, design: .rounded) }
    /// 画面の主役級の数字表示
    static var displayNumberLarge: Font { .system(size: 56, weight: .bold, design: .rounded) }
}
