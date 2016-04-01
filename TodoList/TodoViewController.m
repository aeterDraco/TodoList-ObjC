//
//  TodoViewController.m
//  TodoList
//
//  Created by David Horvath on 31/03/16.
//  Copyright © 2016 Supercharge Kft. All rights reserved.
//

#import "TodoViewController.h"

@interface TodoViewController ()
@property (nonatomic, weak) IBOutlet UILabel *todoLabel;
@property (nonatomic, weak) IBOutlet UIButton *doneButton;

@property (nonatomic, strong) UIAlertController *alert;
@end

@implementation TodoViewController

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.todoLabel.text = _todoItem;
    self.todoLabel.accessibilityLabel = [NSString stringWithFormat:@"Description: %@", _todoItem];
    self.doneButton.accessibilityLabel = @"Done";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action
- (IBAction)doneButtonPressed
{
    [self presentViewController:_alert animated:YES completion:nil];
}

@end
