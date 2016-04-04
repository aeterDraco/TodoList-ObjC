//
//  TodoTableViewKIFTests.m
//  TodoList
//
//  Created by David Horvath on 31/03/16.
//  Copyright © 2016 Supercharge Kft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KIF/KIF.h>

@interface TodoTableViewKIFTests : XCTestCase

@end

@implementation TodoTableViewKIFTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testAddNewItem
{
    [tester tapViewWithAccessibilityLabel:@"Add"];

    UITableView *tableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"tableView"];
    [tester waitForCellAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0] inTableView:tableView];

    NSInteger numberOfRows = [tableView numberOfRowsInSection:0];
    XCTAssertEqual(numberOfRows, 4);
}

- (void)testScrollToItem
{
    // 1. add 14 items to the list
    int count = 0;
    UITableView *tableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"tableView"];

    while(count < 14){
        [tester tapViewWithAccessibilityLabel:@"Add"];
        [tester waitForCellAtIndexPath:[NSIndexPath indexPathForRow:(count+3) inSection:0] inTableView:tableView];
        count++;
    }
    
    // 2. tap on the 17th which is not visible without scrolling
    [tester tapViewWithAccessibilityLabel:@"new cell 17"];
    
    // 3. go back to the table view
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester waitForViewWithAccessibilityLabel:@"tableView"];
}

- (void)testSwipe
{
    // This test should:
    // 1. Delete with swipe the 10th element in the list and see it's not there anymore
    UITableView *tableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"tableView"];
    [tester swipeViewWithAccessibilityLabel:@"new cell 10" inDirection:KIFSwipeDirectionLeft];
    [tester waitForViewWithAccessibilityLabel:@"Delete"];
    [tester tapViewWithAccessibilityLabel:@"Delete"];
    
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"new cell 10"];
    NSInteger numberOfRows = [tableView numberOfRowsInSection:0];
    XCTAssertEqual(numberOfRows, 17);
}

@end
