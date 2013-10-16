//
//  YZStatusItemView.h
//  YZStatusItemViewDemo
//
//  Created by Ethan Lin on 10/15/13.
//  Copyright (c) 2013 github.com/yzlin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface YZStatusItemView : NSImageView

@property (nonatomic, weak) NSStatusItem *statusItem;
@property (nonatomic, strong) NSImage *image;
@property (nonatomic, strong) NSImage *alternateImage;
@property (nonatomic, strong) NSMenu *menu;
@property (nonatomic, strong) NSMenu *rightClickMenu;

- (instancetype)initWithStatusItem:(NSStatusItem *)statusItem;

@end
