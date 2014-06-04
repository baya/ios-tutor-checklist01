//
//  Checklist.h
//  Checklists
//
//  Created by jiangguimin on 14-6-2.
//  Copyright (c) 2014年 Dalnpo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, copy) NSString *iconName;

- (int)countUncheckedItems;

@end
