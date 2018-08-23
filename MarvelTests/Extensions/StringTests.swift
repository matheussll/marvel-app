//
//  StringTests.swift
//  MarvelTests
//
//  Created by Matheus Stefanello Luz on 23/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import XCTest

class StringTests: XCTestCase {
    func testRightThumbnailParsing() {
        let thumbnailString = "thisisthepath.thisisthetype"
        let parsedThumbnail = thumbnailString.parsedThumbnail
        
        XCTAssertEqual(parsedThumbnail.path, "thisisthepath")
        XCTAssertEqual(parsedThumbnail.type, "thisisthetype")
    }
    
    func testRightThumbnailParsingWithBigPath() {
        let thumbnailString = "thisisthepath.thisisthepath.thisisthepath.thisisthetype"
        let parsedThumbnail = thumbnailString.parsedThumbnail
        
        XCTAssertEqual(parsedThumbnail.path, "thisisthepath.thisisthepath.thisisthepath")
        XCTAssertEqual(parsedThumbnail.type, "thisisthetype")
    }
    
    func testWrongThumbnailParsing() {
        let thumbnailString = "thisisthepathandthisisthetype"
        let parsedThumbnail = thumbnailString.parsedThumbnail
        
        XCTAssertEqual(parsedThumbnail.path, "")
        XCTAssertEqual(parsedThumbnail.type, "")
    }
    
    func testStringLabelHeight() {
        let string = "notaemptystring"
        let height = string.heightWithConstrainedWidth(width: 100, font: UIFont.appFont(size: 15))
        XCTAssert(height > 0)
    }
    
    func testEmptyStringLabelHeight() {
        let string = ""
        let height = string.heightWithConstrainedWidth(width: 100, font: UIFont.appFont(size: 15))
        XCTAssert(height == 0)
    }
    
    func testEmptyMD5() {
        let string = ""
        let hashedString = string.MD5
        XCTAssertEqual(hashedString, "d41d8cd98f00b204e9800998ecf8427e")
    }
    
    func testSingleMD5() {
        let string = "a"
        let hashedString = string.MD5
        XCTAssertEqual(hashedString, "0cc175b9c0f1b6a831c399e269772661")
    }
    
    func testComposedMD5() {
        let first = "12345667890"
        let second = "abcdefghijk"
        let third = "a1b2c3d4c5"
        let hashedString = (first+second+third).MD5
        XCTAssertEqual(hashedString, "8983a12a196e831d010b94fa5da6eeb1")
    }
}
