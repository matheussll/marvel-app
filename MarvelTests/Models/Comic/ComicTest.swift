//
//  ComicTest.swift
//  MarvelTests
//
//  Created by Matheus Stefanello Luz on 22/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import XCTest

class ComicTest: XCTestCase {
    func testSuccessfulInit() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "SuccessfulComic", withExtension: "json") else {
            XCTFail("Missing file: SuccessfulComic")
            return
        }
        
        var comic: Comic!
        do {
            let json = try Data(contentsOf: url)
            comic = try JSONDecoder().decode(Comic.self, from: json)
        } catch {
            XCTFail("Decoding failed")
        }
        
        XCTAssertNotNil(comic)
        XCTAssertEqual(comic.name, "TEST1")
    }
}
