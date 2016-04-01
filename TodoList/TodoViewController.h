//
//  TodoViewController.h
//  TodoList
//
//  Created by David Horvath on 31/03/16.
//  Copyright © 2016 Supercharge Kft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoItemDelegate.h"

@interface TodoViewController : UIViewController
@property (nonatomic, strong) NSString *todoItem;
@property (nonatomic, strong) id<TodoItemDelegate> delegate;
@end
