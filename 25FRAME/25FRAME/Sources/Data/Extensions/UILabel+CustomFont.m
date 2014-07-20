//
//  UILabel+CustomFont.m
//  25FRAME
//
//  Created by Vyacheslav Kostechko on 1/27/14.
//  Copyright (c) 2014 Vyacheslav Kostechko. All rights reserved.
//

#import "UILabel+CustomFont.h"

@implementation UILabel (CustomFont)

- (NSString *)fontName {
    return self.font.fontName;
}

- (void)setFontName:(NSString *)fontName {
    self.font = [UIFont fontWithName:fontName size:self.font.pointSize];
}
@end
