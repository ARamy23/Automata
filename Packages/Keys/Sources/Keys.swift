// DO NOT MODIFY
// Automatically generated by Arkana (https://github.com/rogerluan/arkana)

import Foundation
import KeysInterfaces

public enum Keys {
    @inline(__always)
    fileprivate static let salt: [UInt8] = [
        0xe2, 0x2f, 0x53, 0x88, 0xa, 0xed, 0x3d, 0xfe, 0x8f, 0x78, 0xac, 0xf9, 0x46, 0x4d, 0x34, 0x9c, 0x74, 0x73, 0x7b, 0xee, 0x3b, 0xba, 0x33, 0x92, 0x51, 0x38, 0x4f, 0xb6, 0xff, 0xb, 0xbe, 0x7f, 0x8f, 0xf4, 0x9b, 0xb5, 0xa7, 0xb5, 0x6c, 0x92, 0x90, 0x4f, 0xbc, 0x6c, 0x67, 0xce, 0x7a, 0xb8, 0x69, 0x9, 0xda, 0x7, 0xe5, 0xbe, 0x65, 0x66, 0xff, 0xd0, 0x4c, 0x53, 0xf6, 0x5c, 0xcd, 0xb4
    ]

    static func decode(encoded: [UInt8], cipher: [UInt8]) -> String {
        return String(decoding: encoded.enumerated().map { offset, element in
            element ^ cipher[offset % cipher.count]
        }, as: UTF8.self)
    }

    static func decode(encoded: [UInt8], cipher: [UInt8]) -> Bool {
        let stringValue: String = Self.decode(encoded: encoded, cipher: cipher)
        return Bool(stringValue)!
    }

    static func decode(encoded: [UInt8], cipher: [UInt8]) -> Int {
        let stringValue: String = Self.decode(encoded: encoded, cipher: cipher)
        return Int(stringValue)!
    }
}

public extension Keys {
    struct Global: KeysGlobalProtocol {
        public init() {}

        @inline(__always)
        public let newRelicAPIKey: String = {
            let encoded: [UInt8] = [
                0xa6, 0x75, 0x64, 0xe3, 0x46, 0x84, 0xa, 0xac, 0xc9, 0x1d, 0xf4, 0xcb, 0x18, 0x20, 0x2, 0xd2, 0x25, 0x56, 0x15, 0x9e, 0xc, 0xcd, 0x71, 0xdc, 0x66, 0xe, 0x1f, 0xc1, 0x8f, 0x4e, 0xfd, 0x55
            ]
            return Keys.decode(encoded: encoded, cipher: Keys.salt)
        }()
    }
}

public extension Keys {
    struct Debug: KeysEnvironmentProtocol {
        public init() {}

        @inline(__always)
        public let applePayMerchantID: String = {
            let encoded: [UInt8] = [
                0xb7, 0x64, 0x2a, 0xcf
            ]
            return Keys.decode(encoded: encoded, cipher: Keys.salt)
        }()

        @inline(__always)
        public let googleMapsAPIKey: String = {
            let encoded: [UInt8] = [
                0xa4, 0x5c, 0x12, 0xf1, 0x4d, 0xbe, 0x49, 0x9d, 0xcb, 0x5e, 0xd9, 0x9b, 0x27, 0x9, 0x76, 0xc5, 0, 0x45, 0x21, 0xd8, 0x41, 0xcf, 0x77
            ]
            return Keys.decode(encoded: encoded, cipher: Keys.salt)
        }()
    }
}

public extension Keys {
    struct Release: KeysEnvironmentProtocol {
        public init() {}

        @inline(__always)
        public let applePayMerchantID: String = {
            let encoded: [UInt8] = [
                0xb0, 0x7b, 0x22, 0xad, 0x42, 0xb9, 0x53, 0xc7, 0xbb, 0x32, 0x99, 0xb9, 0x27, 0x24, 0x56, 0xaa, 0x15, 0x1a, 0x5d, 0xa0, 0x7d, 0xcc, 0x7b, 0xa0, 0x2b, 0x41, 0x1d, 0x8e, 0x89, 0x63, 0x8c, 0x59, 0xe4, 0x9a, 0xd7, 0xff, 0xe9, 0xe1, 0x21, 0xf4, 0xdd, 0x6a, 0xf2, 0x21, 0x3, 0x89, 0x5b, 0x8b, 0x1e, 0x61, 0xfc, 0x54, 0xaf, 0xc6, 0x43, 0x15, 0xb8, 0xf6, 0xf, 0x3a, 0xc3, 0x78
            ]
            return Keys.decode(encoded: encoded, cipher: Keys.salt)
        }()

        @inline(__always)
        public let googleMapsAPIKey: String = {
            let encoded: [UInt8] = [
                0xda, 0x68, 0x20, 0xe1, 0x6c, 0x80, 0x52, 0xbe, 0xd9, 0x4a, 0xe0, 0xb3, 0x8, 0x24, 0x76, 0xae, 0x21, 0x22, 0x16, 0xd7, 0x7a, 0x88, 0x40, 0xe3, 0x19, 0xc, 0x6a, 0x81, 0xb4, 0x5e, 0x8d, 0xe, 0xc5, 0xb1, 0xdd, 0xf6, 0xfd, 0x93, 0x38, 0xeb, 0xc7, 0x2b, 0xfe, 0x3c, 0x1e, 0xb4, 0x2, 0xd3, 0x33
            ]
            return Keys.decode(encoded: encoded, cipher: Keys.salt)
        }()
    }
}
