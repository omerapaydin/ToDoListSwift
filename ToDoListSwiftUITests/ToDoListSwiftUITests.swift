//
//  ToDoListSwiftUITests.swift
//  ToDoListSwiftUITests
//
//  Created by Ömer on 2.02.2025.
//

import XCTest

final class ToDoListSwiftUITests: XCTestCase {

  
    

    @MainActor
    func testToDo() throws {
       
        let app = XCUIApplication()
        app.launch()
        
        
        let addButton = app.navigationBars["ToDoListSwift.View"].buttons["Add"]

        let elementsQuery = app.alerts["Add Item"].scrollViews.otherElements
        let textField = elementsQuery.collectionViews/*@START_MENU_TOKEN@*/.textFields["Enter your item"]/*[[".cells.textFields[\"Enter your item\"]",".textFields[\"Enter your item\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let okButton = elementsQuery.buttons["OK"]
        
        
        addButton.tap()
        textField.tap()
        textField.typeText("new")
        okButton.tap()
        
       
        

    }
    
    

 
}

