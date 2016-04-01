//
//  TodoViewKIFTests.m
//  TodoList
//
//  Created by David Horvath on 31/03/16.
//  Copyright © 2016 Supercharge Kft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KIF/KIF.h>

@interface TodoViewKIFTests : XCTestCase

@end

@implementation TodoViewKIFTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testAlertPopup
{
    // This test should:
    // 1. open an item
    // 2. press done and see an alert
    // 3. go back
}

- (void)testAlertPopupAndPressOK
{
    // This test should:
    // 1. open an item
    // 2. press done
    // 3. select OK and see going back to list with the removed item not in being in it anymore
}

- (void)testAlertPopupAndPressCancel
{
    // This test should:
    // 1. open an item
    // 2. press done
    // 3. select Cancel and see the same screen
    // 4. go back
}

@end
