//
//  ChecklistsViewController.m
//  Checklists
//
//  Created by jiangguimin on 14-5-30.
//  Copyright (c) 2014年 Dalnpo. All rights reserved.
//

#import "ChecklistsViewController.h"
#import "ChecklistItem.h"

@interface ChecklistsViewController ()

@end

@implementation ChecklistsViewController

{
    
    NSMutableArray *_items;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _items = [[NSMutableArray alloc] initWithCapacity:20];
    
    [self checkListAddItem:@"Walk the dog" checked:NO];
    [self checkListAddItem:@"Brush teeth" checked:YES];
    [self checkListAddItem:@"Learn iOS development" checked:NO];
    [self checkListAddItem:@"Soccer practice" checked:YES];
    [self checkListAddItem:@"Eat ice cream" checked:NO];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)checkListAddItem:(NSString *)text checked:(BOOL)checked
{
    ChecklistItem *item;
    item = [[ChecklistItem alloc] init];
    item.text = text;
    item.checked = checked;
    [_items addObject:item];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    ChecklistItem *item = _items[indexPath.row];
    
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckmarkForCeil:cell withChecklistItem:item];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    ChecklistItem *item = _items[indexPath.row];
    
    [item toggleChecked];
    
    [self configureCheckmarkForCeil:cell withChecklistItem:item];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)configureCheckmarkForCeil:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item
{
    if(item.checked){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

}

- (void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item
{
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_items removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(ChecklistItem *)item
{
    NSInteger newRowIndex = [_items count];
    [_items addObject:item];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        
        UINavigationController *navigationController = segue.destinationViewController;
        
        AddItemViewController *controller = (AddItemViewController *) navigationController.topViewController;
        
        controller.delegate = self;
        
    }
}

@end
