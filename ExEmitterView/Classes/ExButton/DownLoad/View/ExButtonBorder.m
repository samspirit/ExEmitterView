//
//  ExButtonBorder.m
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import "ExButtonBorder.h"
#import "UIImage+ExDownloadButton.h"

@implementation ExButtonBorder

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    [self updateBackgroundImage];
}

- (void)setLineWidth:(CGFloat)lineWidth {
    _lineWidth = lineWidth;
    [self updateBackgroundImage];
}

- (void)configureDefaultAppearance {
    [self setCornerRadius:4];
    [self setLineWidth:1];
}

- (void)updateBackgroundImage {
    [self setBackgroundImage:[UIImage borderedImageWithFillColor:[UIColor clearColor] radius:self.cornerRadius lineColor:self.tintColor lineWidth:self.lineWidth] forState:UIControlStateNormal];

    [self setBackgroundImage:[UIImage borderedImageWithFillColor:self.tintColor radius:self.cornerRadius lineColor:self.tintColor lineWidth:self.lineWidth] forState:UIControlStateHighlighted];
}

- (void)tintColorDidChange {
    [super tintColorDidChange];
    [self updateBackgroundImage];
}

- (void)cleanDefaultAppearance {
    [self setBackgroundImage:nil forState:UIControlStateNormal];
    [self setBackgroundImage:nil forState:UIControlStateHighlighted];
    [self setAttributedTitle:nil forState:UIControlStateNormal];
    [self setAttributedTitle:nil forState:UIControlStateHighlighted];
}
@end
