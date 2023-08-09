//
//  StringExtensions.swift
//  FFExerciseTemplate
//
//  Created by João David on 16/03/2018.
//  Copyright © 2018 Farfetch. All rights reserved.
//

import Foundation

extension String {

    func MD5() -> String {

        let length = Int(CC_MD5_DIGEST_LENGTH)
        var digest = [UInt8](repeating: 0, count: length)

        if let d = self.data(using: String.Encoding.utf8) {
            _ = d.withUnsafeBytes { (body: UnsafePointer<UInt8>) in
                CC_MD5(body, CC_LONG(d.count), &digest)
            }
        }

        return (0..<length).reduce("") {
            $0 + String(format: "%02x", digest[$1])
        }
    }

    /**
    @brief Converts current Hypermedia URL (HATEOAS) and parses the last id url path component
    Example: 'https://swapi.dev/api/starships/22/'
    @return id - Example: 22
    */
    func parsedHypermediaId() -> Int? {

        let regex = try! NSRegularExpression(pattern:"/([0-9]*)/", options: [])
        var id: Int? = nil
        regex.enumerateMatches(in: self, options: [], range: NSMakeRange(0, self.utf16.count)) { result, flags, stop in

            if let r = result?.range(at: 1), let range = Range(r, in: self) {

                id = Int(self[range])
            }
        }

        return id
    }

    static func timestamp() -> String {

        let dateFormatter = DateFormatter()
        let date = Date()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyyMMddHHmmssSSSS"

        return dateFormatter.string(from: date)
    }
}
