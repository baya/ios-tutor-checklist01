//
//  AddItemViewController.h
//  Checklists
//
//  Created by jiangguimin on 14-5-31.
//  Copyright (c) 2014年 Dalnpo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddItemViewController;
@class ChecklistItem;

@protocol AddItemViewControllerDelegate <NSObject>

- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller;
- (void)addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(ChecklistItem *)item;

@end

@interface AddItemViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) id <AddItemViewControllerDelegate> delegate;

- (IBAction)cancel;
- (IBAction)done;

@end
