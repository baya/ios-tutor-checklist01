//
//  ChecklistItem.m
//  Checklists
//
//  Created by jiangguimin on 14-5-31.
//  Copyright (c) 2014年 Dalnpo. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem

- (id)init
{
    if (self = [super init]){
        self.checked = NO;
    }
    
    return self;
}

- (void)toggleChecked
{
    self.checked = !self.checked;
}

@end
