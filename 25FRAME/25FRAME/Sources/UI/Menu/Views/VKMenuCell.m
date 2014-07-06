//
//  VKMenuCell.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 7/6/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "VKMenuCell.h"

@implementation VKMenuCell

#pragma mark - Lifecycle

- (void)awakeFromNib
{
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = COLOR_MENU_CELL_SELECTED_BACKGROUND;
    [self setSelectedBackgroundView:bgColorView];
    
    self.imageView.highlightedImage = [self imageForHighlightedState];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Private

- (UIImage*)imageForHighlightedState {
    NSString* imageName;
    switch (self.tag) {
        case TAG_VIEW_MOVIES:{
            imageName = MENU_ICON_MOVIES_SELECTED;
            break;
        }
        case TAG_VIEW_ACTORS:{
            imageName = MENU_ICON_ACTORS_SELECTED;
            break;
        }
        case TAG_VIEW_DIRECTORS:{
            imageName = MENU_ICON_DIRECTORS_SELECTED;
            break;
        }
        case TAG_VIEW_FAVORITES:{
            imageName = MENU_ICON_FAVORITES_SELECTED;
            break;
        }
        case TAG_VIEW_HISTORY:{
            imageName = MENU_ICON_HISTORY_SELECTED;
            break;
        }
        default:
            break;
    }
    UIImage* image = [UIImage imageNamed:imageName];
    return image;
}

@end
