//
//  ExStopDownloadButton.m
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import "ExStopDownloadButton.h"
#import "NSLayoutConstraint+ExDownloadButton.h"
#import "UIImage+ExDownloadButton.h"

static const CGFloat kDefaultStopButtonWidth = 8.f;

@interface ExStopDownloadButton()

@property (nonatomic, weak) UIButton *stopButton;
@end

@implementation ExStopDownloadButton

#pragma mark - initialization

-(instancetype)init
{
    if (self = [super init]) {
        UIButton *stopButton = [self createStopButton];
        stopButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:stopButton];
        self.stopButton = stopButton;
        
        [self addConstraints:[self createStopButtonConstraints]];
        [self updateAppearance];
        [self setNeedsDisplay];
    }
    return self;
}

#pragma mark - properties

- (void)setStopButtonWidth:(CGFloat)stopButtonWidth {
    _stopButtonWidth = stopButtonWidth;
    [self.stopButton setImage:[UIImage stopImageOfSize:stopButtonWidth color:self.tintColor] forState:UIControlStateNormal];
    [self setNeedsDisplay];
}

#pragma mark - private methods

- (UIButton *)createStopButton {
    UIButton *stopButton = [UIButton buttonWithType:UIButtonTypeCustom];
    stopButton.tintColor = [UIColor clearColor];
    _stopButtonWidth = kDefaultStopButtonWidth;
    return stopButton;
}

- (NSArray *)createStopButtonConstraints {
    NSMutableArray *constraints = [NSMutableArray array];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsForWrappedSubview:self.stopButton withInsets:UIEdgeInsetsZero]];
    return constraints;
}

- (ExCircleProgressView *)createCircleProgressView {
    ExCircleProgressView *circleProgressView = [[ExCircleProgressView alloc] init];
    return circleProgressView;
}

#pragma mark - appearance

- (void)updateAppearance {
    [self.stopButton setImage:[UIImage stopImageOfSize:_stopButtonWidth color:self.tintColor] forState:UIControlStateNormal];
}

- (void)tintColorDidChange {
    [super tintColorDidChange];
    [self updateAppearance];
}

@end
