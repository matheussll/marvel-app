//
//  CharactersViewModelTest.swift
//  MarvelTests
//
//  Created by Matheus Stefanello Luz on 23/08/18.
//  Copyright © 2018 msluz. All rights reserved.
//

import XCTest


class CharactersViewModelTest: XCTestCase {
    var character: Character!
    
    override func setUp() {
        super.setUp()
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
        self.character = character
    }
    
    override func tearDown() {
        self.character = nil
        super.tearDown()
    }

    func testViewModelSuccessfulInit() {
        let viewModel = CharacterDetailViewModel(character: character)
        XCTAssertNotNil(viewModel)
    }
    
    func testViewModelParams() {
        let viewModel = CharacterDetailViewModel(character: character)
        XCTAssertNotNil(viewModel.comicsCount)
        XCTAssertNotNil(viewModel.characterDescription)
        XCTAssertNotNil(viewModel.characterName)
        XCTAssertNotNil(viewModel.characterImageUrl)
    }
    
    func testViewModelParamsValue() {
        let viewModel = CharacterDetailViewModel(character: character)
        XCTAssertEqual(viewModel.comicsCount, 2)
        XCTAssertEqual(viewModel.characterDescription, "test2")
        XCTAssertEqual(viewModel.characterName, "Test1")
        XCTAssertEqual(viewModel.characterImageUrl,  "http://i.annihil.us/u/prod/marvel/i/mg/9/20/test1.jpg")
    }
    
//    func testViewModelGetCharacterAtIndex() {
//        let viewModel = CharacterDetailViewModel(character: character)
//        XCTAssertNotNil(viewModel.characterComic(at: 1))
//        XCTAssertEqual(viewModel.characterComic(at: 1).name, "Uncanny X-Men (1963) #517")
//    }
}
