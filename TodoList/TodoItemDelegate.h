//
//  TodoItemDelegate.h
//  TodoList
//
//  Created by David Horvath on 31/03/16.
//  Copyright © 2016 Supercharge Kft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TodoItemDelegate <NSObject>
@required
- (void)deleteTodoItem:(NSString *)object;

@end
