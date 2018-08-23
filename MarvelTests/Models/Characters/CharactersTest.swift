//
//  CharactersTest.swift
//  MarvelTests
//
//  Created by Matheus Stefanello Luz on 22/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import XCTest

class CharactersTest: XCTestCase {
    func testSuccessfulInit() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "SuccessfulCharacters", withExtension: "json") else {
            XCTFail("Missing file: SuccesfulCharacters.json")
            return
        }
        
        var characters: Characters!
        do {
            let json = try Data(contentsOf: url)
            characters = try JSONDecoder().decode(Characters.self, from: json)
        } catch {
            XCTFail("Decoding failed")
        }
        
        XCTAssertNotNil(characters)
        XCTAssertEqual(characters.count, 20)
        XCTAssertEqual(characters.total, 1491)
        XCTAssertEqual(characters.limit, 20)
        XCTAssertEqual(characters.offset, 50)
    }
    
    func testWrongParamsJson() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "WrongParamsCharacters", withExtension: "json") else {
            XCTFail("Missing file: WrongParamsCharacters.json")
            return
        }
        
        var characters: Characters!
        var err: Error!
        do {
            let json = try Data(contentsOf: url)
            characters = try JSONDecoder().decode(Characters.self, from: json)
        } catch {
            err = error
        }
        
        XCTAssertNil(characters)
        XCTAssertNotNil(err)
    }
}
