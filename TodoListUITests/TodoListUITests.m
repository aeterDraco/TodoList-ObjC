//
//  TodoListUITests.m
//  TodoListUITests
//
//  Created by Ricardo Quintero on 02/04/16.
//  Copyright © 2016 Supercharge Kft. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TodoListUITests : XCTestCase

@end

@implementation TodoListUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.navigationBars[@"Todos"].buttons[@"Add"] tap];
    [app.tables[@"tableView"].staticTexts[@"new cell"] tap];
    [app.navigationBars[@"Todo"].buttons[@"Todos"] tap];
    
    XCUIElement *tableviewTable = [[XCUIApplication alloc] init].tables[@"tableView"];
    [tableviewTable.staticTexts[@"Check out FBSnapshot"] tap];
    [tableviewTable.buttons[@"Delete"] tap];
    
    XCTAssert(tableviewTable.staticTexts[@"Check out FBSnapshot"]);
    
    
    
    
    [app.navigationBars[@"Todos"].buttons[@"Add"] tap];
    
    [tableviewTable.staticTexts[@"new cell"] tap];
    [tableviewTable.buttons[@"Delete"] tap];
    [tableviewTable.staticTexts[@"See how Xcode UI testing works"] tap];
    [app.buttons[@"Done"] tap];
    [app.alerts[@"Complete the task?"].collectionViews.buttons[@"OK"] tap];
    [app.navigationBars[@"Todo"].buttons[@"Todos"] tap];
    
}

@end
