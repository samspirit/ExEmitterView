//
//  ExLongPressButtonTopView.m
//  ExEmitterView
//
//  Created by ecarx on 2019/11/28.
//

#import "ExLongPressButtonTopView.h"

@implementation ExLongPressButtonTopView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self != nil) {
        self.userInteractionEnabled = NO;
        self.layer.cornerRadius = frame.size.height/2.0;
        self.backgroundColor = [UIColor redColor];
    }
    return self;
    
}

@end
