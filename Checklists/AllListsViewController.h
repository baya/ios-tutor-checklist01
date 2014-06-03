//
//  AllListsViewController.h
//  Checklists
//
//  Created by jiangguimin on 14-6-2.
//  Copyright (c) 2014年 Dalnpo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"
#import "ChecklistItem.h"

@class DataModel;

@interface AllListsViewController : UITableViewController <ListDetailViewControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) DataModel *dataModel;

@end
