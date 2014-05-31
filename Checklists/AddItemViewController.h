//
//  AddItemViewController.h
//  Checklists
//
//  Created by jiangguimin on 14-5-31.
//  Copyright (c) 2014年 Dalnpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)cancel;
- (IBAction)done;

@end
