// YZStatusItemView.m
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

static const CGFloat kYZStatusItemViewImageHPadding = 4.0f;

#import "YZStatusItemView.h"

@interface YZStatusItemView () <NSMenuDelegate>

@property (nonatomic, assign) BOOL isMenuVisible;

@end

@implementation YZStatusItemView

- (id)initWithFrame:(NSRect)frame
{
    return [self initWithStatusItem:nil];
}

- (instancetype)initWithStatusItem:(NSStatusItem *)statusItem
{
    NSParameterAssert(statusItem);

    if (!(self = [super initWithFrame:NSMakeRect(0, 0, _statusItem.length ?: (18.0 + 2 * kYZStatusItemViewImageHPadding), 0)]))
        return nil;

    _statusItem = statusItem;
    self.image = statusItem.image;
    statusItem.image = nil;
    self.alternateImage = statusItem.alternateImage;
    statusItem.alternateImage = nil;
    self.menu = statusItem.menu;
    statusItem.menu = nil;

    return self;
}

#pragma mark - NSImageView

- (void)setImage:(NSImage *)image
{
    _image = image;
    _statusItem.image = nil;
    [super setImage:image];
}

- (void)setAlternateImage:(NSImage *)alternateImage
{
    _alternateImage = alternateImage;
    _statusItem.alternateImage = nil;

    [self needsDisplay];
}

- (void)drawRect:(NSRect)dirtyRect
{
    [_statusItem drawStatusBarBackgroundInRect:dirtyRect withHighlight:_isMenuVisible];

    [super drawRect:dirtyRect];
}

#pragma mark Mouse Event

- (void)mouseDown:(NSEvent *)event
{
    [self popUpMenu];

    [self setNeedsDisplay];
}

- (void)rightMouseDown:(NSEvent *)event
{
    if (_rightClickMenu) {
        [self popUpMenu:_rightClickMenu];
    } else {
        [self mouseDown:event];
    }
}

#pragma mark - Menu

- (void)popUpMenu
{
    [self popUpMenu:_menu];
}

- (void)popUpMenu:(NSMenu *)menu
{
    if (menu) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_menuWillOpen:) name:NSMenuDidBeginTrackingNotification object:menu];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_menuDidClose:) name:NSMenuDidEndTrackingNotification object:menu];

        if (_alternateImage)
            [super setImage:_alternateImage];
        else
            [super setImage:_image];
        [_statusItem popUpStatusItemMenu:menu];
    }
}

#pragma mark - NSMenu Tracking

- (void)_menuWillOpen:(NSNotification *)notification
{
    _isMenuVisible = YES;
    [self setNeedsDisplay];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSMenuDidBeginTrackingNotification object:notification.object];
}

- (void)_menuDidClose:(NSNotification *)notification
{
    _isMenuVisible = NO;
    self.image = _image;
    [self setNeedsDisplay];

    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSMenuDidEndTrackingNotification object:notification.object];
}

@end
