//
//  YZAppDelegate.h
//  YZStatusItemViewDemo
//
//  Created by Ethan Lin on 10/15/13.
//  Copyright (c) 2013 github.com/yzlin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface YZAppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, assign) IBOutlet NSWindow *window;
@property (nonatomic, weak) IBOutlet NSMenu *mainMenu;
@property (nonatomic, weak) IBOutlet NSMenu *secondMenu;

@end
