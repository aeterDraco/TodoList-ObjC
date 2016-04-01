//
//  TodoListViewController.m
//  TodoList
//
//  Created by David Horvath on 31/03/16.
//  Copyright © 2016 Supercharge Kft. All rights reserved.
//

#import "TodoListViewController.h"
#import "TodoViewController.h"

@interface TodoListViewController ()
@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation TodoListViewController

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.items = [NSMutableArray arrayWithArray:@[@"Learn KIF",
                                                  @"See how Xcode UI testing works",
                                                  @"Check out FBSnapshot"]];

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(insertNewItem:)];

    self.navigationItem.rightBarButtonItem = addButton;
    self.navigationItem.leftBarButtonItem.accessibilityLabel = @"Back";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"Add";

    self.tableView.accessibilityLabel = @"tableView";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}

#pragma mark - Navigation Bar
- (void)insertNewItem:(id)sender
{
    // It should add a new item to the list
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];

    NSString *object = _items[indexPath.row];
    cell.textLabel.text = object;
    cell.accessibilityLabel = [NSString stringWithFormat:@"%@ %li", object, (long)indexPath.row];
    cell.accessoryView.accessibilityLabel = @"Delete";

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return false if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.items removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

#pragma mark - TodoItemDelegate
- (void)deleteTodoItem:(NSString *)object
{
    [self.items removeObject:object];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showWhatTodo"])
    {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        if (indexPath)
        {
            NSString *object = _items[indexPath.row];
            TodoViewController *todoViewController = segue.destinationViewController;
            todoViewController.todoItem = object;
            todoViewController.delegate = self;
        }
    }
}

@end
