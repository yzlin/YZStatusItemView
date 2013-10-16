// YZAppDelegate.m
//
// Copyright (c) 2013 github.com/yzlin
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "YZStatusItemView.h"

#import "YZAppDelegate.h"

@interface YZAppDelegate ()

@property (nonatomic, strong) NSStatusItem *statusBarItem;

@end

@implementation YZAppDelegate

- (void)awakeFromNib
{
    self.statusBarItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    _statusBarItem.menu = _mainMenu;
    _statusBarItem.highlightMode = YES;
    _statusBarItem.image = [NSImage imageNamed:@"StatusBarIcon"];
    _statusBarItem.alternateImage = [NSImage imageNamed:@"StatusBarIcon_highlight"];

    YZStatusItemView *statusItemView = [[YZStatusItemView alloc] initWithStatusItem:_statusBarItem];
    statusItemView.rightClickMenu = _secondMenu;
    _statusBarItem.view = statusItemView;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

@end
