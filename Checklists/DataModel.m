//
//  DataModel.m
//  Checklists
//
//  Created by jiangguimin on 14-6-3.
//  Copyright (c) 2014年 Dalnpo. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (id)init
{
    if ((self = [super init])) {
        [self loadChecklists];
        [self registerDefaults];
    }
    
    return self;
}


- (NSString *)documentDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirecotry = [paths firstObject];
    return documentsDirecotry;
}

- (NSString *)dataFilePath
{
    return [[self documentDirectory] stringByAppendingPathComponent:@"Checklists.plist"];
}

- (void)saveChecklists
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archiver encodeObject:_lists forKey:@"Checklists"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

- (void)loadChecklists
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        
        _lists = [unarchiver decodeObjectForKey:@"Checklists"];
        [unarchiver finishDecoding];
    } else {
        _lists = [[NSMutableArray alloc] initWithCapacity:20];
    }
}

- (void)registerDefaults
{
    NSDictionary *dictionary = @{ @"ChecklistIndex" : @-1 };
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
}

- (NSInteger)indexOfSelectedChecklist
{
    return [[NSUserDefaults standardUserDefaults] integerForKey:@"ChecklistIndex"];
}

- (void)setIndexOfSelectedChecklist:(NSInteger)index
{
    [[NSUserDefaults standardUserDefaults] setInteger:index forKey:@"ChecklistIndex"];
}

@end
