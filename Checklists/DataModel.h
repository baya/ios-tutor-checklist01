//
//  DataModel.h
//  Checklists
//
//  Created by jiangguimin on 14-6-3.
//  Copyright (c) 2014年 Dalnpo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *lists;

- (void)saveChecklists;
- (NSInteger)indexOfSelectedChecklist;
- (void)setIndexOfSelectedChecklist:(NSInteger)index;
- (void)sortChecklists;

@end
