//
//  CharacterTest.swift
//  MarvelTests
//
//  Created by Matheus Stefanello Luz on 22/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import XCTest

class CharacterTest: XCTestCase {
    func testSuccessfulInit() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "SuccessfulCharacter", withExtension: "json") else {
            XCTFail("Missing file: SuccesfulCharacter.json")
            return
        }
        
        var character: Character!
        do {
            let json = try Data(contentsOf: url)
            character = try JSONDecoder().decode(Character.self, from: json)
        } catch {
            XCTFail("Decoding failed")
        }
        
        XCTAssertNotNil(character)
        XCTAssertEqual(character.id, 1)
        XCTAssertEqual(character.name, "Test1")
        XCTAssertEqual(character.description, "test2")
        XCTAssertEqual(character.thumbnail, "http://i.annihil.us/u/prod/marvel/i/mg/9/20/test1.jpg")
        XCTAssertNotNil(character)
    }
}
