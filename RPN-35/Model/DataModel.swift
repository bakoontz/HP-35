//
//  ModelHP35.swift
//  RPN-35
//
//  Created by Enrique Haro on 2/8/24.
//

import SwiftUI

class DataModel {
    static let shared = DataModel()

    func keys(for model: Model) -> [Key] {
        switch Global.model {
        case .hp35: return hp35Keys
        case .hp45: return hp45Keys
        case .hp21: return hp21Keys
        case .mk61: return mk61Keys
        }
    }

    init() {}

    struct Key: Identifiable {
        let id: String = UUID().uuidString
        let type: KeyType
        let ops: [Op]

        let bLabel1: String
        let bLabel2: String
        let bLabel1Size: CGFloat
        let bLabel2Size: CGFloat
        let bOffset: CGFloat
        let fLabel1: String
        let fLabel2: String
        let fLabel1Size: CGFloat
        let fLabel2Size: CGFloat
        let fOffset: CGFloat
        let gLabel1: String
        let gLabel2: String
        let gLabel1Size: CGFloat
        let gLabel2Size: CGFloat
        let gOffset: CGFloat

        // Initializer for HP-35 keys
        init(
            type: KeyType = .none,
            ops: [Op] = [],
            bLabel1: String = "",
            bLabel2: String = "",
            bLabel1Size: CGFloat = 17,
            bLabel2Size: CGFloat = 17,
            bOffset: CGFloat = 6,
            fLabel1: String = "",
            fLabel2: String = "",
            fLabel1Size: CGFloat = 16,
            fLabel2Size: CGFloat = 11,
            fOffset: CGFloat = 4,
            gLabel1: String = "",
            gLabel2: String = "",
            gLabel1Size: CGFloat = 16,
            gLabel2Size: CGFloat = 11,
            gOffset: CGFloat = 4) {
                self.type = type
                self.ops = ops
                self.bLabel1 = bLabel1
                self.bLabel2 = bLabel2
                self.bLabel1Size = bLabel1Size
                self.bLabel2Size = bLabel2Size
                self.bOffset = bOffset
                self.fLabel1 = fLabel1
                self.fLabel2 = fLabel2
                self.fLabel1Size = fLabel1Size
                self.fLabel2Size = fLabel2Size
                self.fOffset = fOffset
                self.gLabel1 = gLabel1
                self.gLabel2 = gLabel2
                self.gLabel1Size = gLabel1Size
                self.gLabel2Size = gLabel2Size
                self.gOffset = gOffset
            }

        // Aditional initializer to simplify HP-45 keys
        init(
            type: KeyType = .none,
            ops: [Op] = [],
            _ bLabel1: String,
            _ bLabel2: String,
            _ bLabel1Size: CGFloat,
            _ bLabel2Size: CGFloat,
            _ bOffset: CGFloat,
            _ fLabel1: String = "",
            _ fLabel2: String = "",
            _ fLabel1Size: CGFloat = 0,
            _ fLabel2Size: CGFloat = 0,
            _ fOffset: CGFloat = 0,
            _ gLabel1: String = "",
            _ gLabel2: String = "",
            _ gLabel1Size: CGFloat = 15,
            _ gLabel2Size: CGFloat = 0,
            _ gOffset: CGFloat = 0) {
                self.type = type
                self.ops = ops
                self.bLabel1 = bLabel1
                self.bLabel2 = bLabel2
                self.bLabel1Size = bLabel1Size
                self.bLabel2Size = bLabel2Size
                self.bOffset = bOffset
                self.fLabel1 = fLabel1
                self.fLabel2 = fLabel2
                self.fLabel1Size = fLabel1Size
                self.fLabel2Size = fLabel2Size
                self.fOffset = fOffset
                self.gLabel1 = gLabel1
                self.gLabel2 = gLabel2
                self.gLabel1Size = gLabel1Size
                self.gLabel2Size = gLabel2Size
                self.gOffset = gOffset
            }

        var bLabel: some View { BLabel(key: self) }
        var fLabel: some View { FLabel(key: self) }
        var gLabel: some View { GLabel(key: self) }
    }

    struct BLabel: View {
        let key: Key
        let font1: Font
        let font2: Font

        init(key: Key) {
            self.key = key
            let size1 = key.bLabel1Size * (.mac ? 1.0 : CGFloat(1.2, 1.0))
            let size2 = key.bLabel2Size * (.mac ? 1.0 : CGFloat(1.2, 1.0))
            if .isMK61 {
                self.font1 = .mk61Font(size: size1).weight(.semibold)
                self.font2 = .mk61Font(size: size2).weight(.semibold)
            } else {
                self.font1 = .system(size: size1)
                self.font2 = .system(size: size2)
            }
        }

        var body: some View {
            HStack(spacing: 0.0) {
                Text(key.bLabel1)
                    .font(font1)
                Text(key.bLabel2)
                    .font(font2)
                    .baselineOffset(key.bOffset)
            }
        }
    }

    struct FLabel: View {
        let key: Key

        var body: some View {
            HStack(spacing: 0.0) {
                Text(key.fLabel1)
                    .font(.system(size: key.fLabel1Size * (.mac ? 1.0 : CGFloat(1.2, 1.0)), weight: .regular))
                Text(key.fLabel2)
                    .baselineOffset(key.fOffset)
                    .font(.system(size: key.fLabel2Size * (.mac ? 1.0 : CGFloat(1.2, 1.0)), weight: .regular))
            }
        }
    }

    struct GLabel: View {
        let key: Key

        var body: some View {
            HStack(spacing: 0.0) {
                Text(key.gLabel1)
                    .font(.system(size: key.gLabel1Size * (.mac ? 1.0 : CGFloat(1.2, 1.0)), weight: .regular))
                Text(key.gLabel2)
                    .baselineOffset(key.gOffset)
                    .font(.system(size: key.gLabel2Size * (.mac ? 1.0 : CGFloat(1.2, 1.0)), weight: .regular))
            }
        }
    }
}

struct Sym {
    static let x = "\u{1D499}"
    static let y = "\u{1D49A}"
    static let pi = "\u{1D6D1}"
    static let e = "\u{1D486}"
    static let add = "\u{002B}"
    static let dot = "\u{2022}"
    static let substract = "\u{002D}"
    static let multiply = "\u{00D7}"
    static let divide = "\u{00F7}"
    static let sqrt = "\u{221A}"
    static let left = "\u{21E6}"
    static let right = "\u{2B95}"
    static let up = "\u{21E7}"
    static let down = "\u{21E9}"
    static let exchange = "\u{1D499}\u{2276}\u{1D49A}"

    static let upTriangle = "\u{25B2}"
    static let downTriangle = "\u{25BC}"
    static let leftTriangle = "\u{25C0}"
    static let rightTriangle = "\u{25B6}"

    static let on = "\u{23FB}"

    // MK 61
    static let notEqual = "\u{2260}"
    static let greaterEqual = "\u{2265}"
    static let leftArrow = "\u{2190}"
    static let rightArrow = "\u{2192}"
    static let leftRightArrow = "\u{2194}"
    static let upChevron = "\u{2303}"
    static let downChevron = "\u{2304}"
    static let lineCircle = "\u{29B5}"
    static let plusCircle = "\u{2295}"

}

extension Sym {
    //  RPN-35
    static let down35 = "\u{2193}"
    static let up35 = "\u{2191}"

    //  HP-45
    static let macron = "\u{0305}"
    static let delta = "\u{0394}"
    static let summation = "\u{2211}"
}

extension String {
    var ops35: [Op] {
        switch self {
        case "^": return [.powerXY]
        case "l": return [.log]
        case "n": return [.ln]
        case "e": return [.ex]
        case "C": return .isHP35 ? [.clr] : [.none, .clr]
        case "q": return [.sqrt]
        case "a": return [.fShift]
        case "s": return [.sin, .asin]
        case "c": return [.cos, .acos]
        case "t": return [.tan, .atan]
        case "i": return [.inverse]
        case "L": return [.exchangeXY]
        case "D": return .isHP45 ? [.rotateDown, .stdDev] : [.rotateDown]
        case "S": return [.sto(0, op: .none)]
        case "R": return [.rcl(0, op: .none)]
        case "\r": return [.enter]
        case "h": return [.chs]
        case "E": return [.eex]
        case "X": return .isHP35 ? [.clrX] : [.none, .clrX]
        case "-": return [.substract, .mSubstract]
        case "+": return [.add, .mAdd]
        case "*": return [.multiply, .mMultiply]
        case "/": return [.divide, .mDivide]
        case "p": return .isHP35 ? [.pi] : [.none, .pi]
        case "Y": return .isHP21 ? [.dsp] : [.none]
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".": return [.digit(self)]

        // HP-45
        case "f": return [.fix]
        case "P": return [.toP, .toR]
        case "M": return [.toDMS]
        case "N": return [.fromDMS]
        case "x": return [.none, .lstX]
        case "Z": return [.sumPlus, .sumMinus]

        // Mac Keyboard only
        case .delete: return [.delete]
        default: return []
        }
    }
}
