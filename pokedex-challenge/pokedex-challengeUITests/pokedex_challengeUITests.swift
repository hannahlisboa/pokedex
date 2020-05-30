//
//  pokedex_challengeUITests.swift
//  pokedex-challengeUITests
//
//  Created by Hannah  on 19/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import XCTest

class pokedex_challengeUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }
    
    /*
     test select correct pokemon
     */
    func testShowPokemonDetail(){
        let cell = app.tables.cells.firstMatch
        let button = cell.buttons.element.firstMatch
        let titleCell = button.label.components(separatedBy: "\n").last
        
        button.tap()
        let titleDetail = app.staticTexts["namePokemon"].label
        
        XCTAssertEqual(titleCell, titleDetail, "not show detail pokemon correct")
        
        app.buttons["backButton"].tap()

    }
    
    func testShowPokemonForTypesInDetails(){
        
        let tableCells = app.tables.cells
             
             if tableCells.count > 0 && tableCells.count >= 2 {
                 let count: Int = 2
                 
                 for i in stride(from: 0, to: count , by: 1) {
                     let tableCell = tableCells.element(boundBy: i)
                     for index in stride(from: 0, to: 2, by: 1) {
                         tableCell.buttons.element(boundBy: index).tap()
                        XCTAssertTrue(app.tables.firstMatch.waitForExistence(timeout: 3 ))

                         let buttons = app.buttons.matching(identifier: "typePokemon")
                           for i in stride(from: 0, to: buttons.count , by: 1) {
                               let typeButton = buttons.element(boundBy: i)
                               
                               let titleButton = typeButton.label
                               typeButton.tap()
                               let titleType = app.staticTexts["typeTitle"].label
                               app.swipeUp()
                                
                               XCTAssertTrue(app.tables.firstMatch.waitForExistence(timeout: 3 ))
                               XCTAssertEqual(titleButton, titleType, "not show type pokemon correct")

                               let closeButton = app.buttons["closeButton"]
                               closeButton.tap()
                           }
                                                                                               

                            app.buttons["backButton"].tap()
                     }
                     
                     
                 }
        
        }
    }
}
