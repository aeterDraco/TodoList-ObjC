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
    [tester tapViewWithAccessibilityLabel:@"Learn KIF 0"];
    [tester waitForViewWithAccessibilityLabel:@"Description: Learn KIF"];
    [tester tapViewWithAccessibilityLabel:@"Done"];
}

- (void)tearDown
{
    [super tearDown];
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester waitForViewWithAccessibilityLabel:@"tableView"];
}

- (void)testAlertPopup
{
    // This test should:
    // 2. press done and see an alert
    
    [tester waitForViewWithAccessibilityLabel:@"Cancel"];
    [tester tapViewWithAccessibilityLabel:@"Cancel"];
}

- (void)testAlertPopupAndPressOK
{
    // This test should:
    // 3. select OK and see going back to list with the removed item not in being in it anymore
    [tester waitForViewWithAccessibilityLabel:@"OK"];
    [tester tapViewWithAccessibilityLabel:@"OK"];
    
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Learn KIF 0"];
}

//- (void)testAlertPopupAndPressCancel
//{
//    // This test should:
//    // 1. open an item
//    // 2. press done
//    // 3. select Cancel and see the same screen
//    // 4. go back
//}

@end
