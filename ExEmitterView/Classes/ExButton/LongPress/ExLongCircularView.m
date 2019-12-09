//
//  ExLongCircularView.m
//  ExEmitterView
//
//  Created by ecarx on 2019/11/28.
//

#import "ExLongCircularView.h"

@implementation ExLongCircularView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        self.layer.cornerRadius = frame.size.height/2.0;
    }
    return self;
}

@end
