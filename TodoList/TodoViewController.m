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
    _alert = [UIAlertController alertControllerWithTitle:@"Complete the task?"
                                                 message:nil
                                          preferredStyle:UIAlertControllerStyleAlert];
    _alert.accessibilityLabel = @"Alert";
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         [_delegate deleteTodoItem:_todoItem];
                                                     }];
    okAction.accessibilityLabel = @"OK";
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                     }];
    cancelAction.accessibilityLabel = @"Cancel";
    
    [_alert addAction:okAction];
    [_alert addAction:cancelAction];
    

    
    [self presentViewController:_alert animated:YES completion:nil];
}

@end
