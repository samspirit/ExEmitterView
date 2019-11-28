//
//  ExLongPressButton.m
//  ExEmitterView
//
//  Created by ecarx on 2019/11/27.
//

#import "ExLongPressButton.h"
#import <AudioToolbox/AudioToolbox.h>
#import "ExLongPressButtonTopView.h"
#import "ExLongPressButtonBottomView.h"

@interface ExLongPressButton()
@property (assign, nonatomic) float hasTouchTime;   // 已经触摸时间
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) ExLongPressButtonTopView *topView;
@property (strong, nonatomic) ExLongPressButtonBottomView *bottomView;

@property (nonatomic, strong) UIView  *currentView;
@end

@implementation ExLongPressButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.currentView];
        self.currentView.hidden = YES;
        self.backgroundColor = [UIColor colorWithRed:207/255.0 green:206/255.0 blue:200/255.0 alpha:.8];
        self.layer.cornerRadius = self.frame.size.height/2.0;
        self.bottomView = [[ExLongPressButtonBottomView alloc] initWithFrame:self.bounds];
        [self addSubview:self.bottomView];
        self.topView = [[ExLongPressButtonTopView alloc] initWithFrame:self.bounds];
        self.topView.transform = CGAffineTransformMakeScale(0.75, 0.75);
        [self addSubview:self.topView];
        _maxPressTime = 5.0f;
    }
    return self;
}

- (void)setTopColor:(UIColor *)topColor {
    self.topView.backgroundColor = topColor;
}

- (void)setProgressColor:(UIColor *)progressColor {
    self.bottomView.progressColor = progressColor;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.currentView.hidden = NO;
    self.hasTouchTime = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(drawBottomRect) userInfo:nil repeats:YES];
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.currentView.hidden = YES;
    NSLog(@"%f",self.hasTouchTime);
    
    
    
    if (self.hasTouchTime <= self.maxPressTime) {
        
        if (self.hasTouchTime < 0.5) {
            /// 触发点击
            if (self.tapCompleteHandler) {
                self.tapCompleteHandler();
            }
            ///取消长按
            if (self.cancelLongPressCompleteHandler) {
                self.cancelLongPressCompleteHandler();
            }
        } else {
            // 结束长按
            if (self.cancelLongPressCompleteHandler) {
                self.cancelLongPressCompleteHandler();
            }
        }
    }
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.bottomView.endAngle = 0;
    
    [UIView animateWithDuration:.35
                     animations:^{
                         self.transform = CGAffineTransformIdentity;
                         self.topView.transform = CGAffineTransformMakeScale(0.8, 0.8);
                     }];
}


- (void)drawBottomRect {
    self.hasTouchTime += 0.02;
    // 开始长按
    if (self.hasTouchTime > 0.5) {
        if (self.startLongPressCompleteHandler) {
            self.startLongPressCompleteHandler();
        }
        [UIView animateWithDuration:.35
                         animations:^{
                             self.transform = CGAffineTransformMakeScale(1.3, 1.3);
                             self.topView.transform = CGAffineTransformMakeScale(0.5, 0.5);
                         }];
        self.bottomView.endAngle = M_PI * 2 * ((self.hasTouchTime - 0.5)/(self.maxPressTime - 0.5));
    }
    
    if (self.hasTouchTime > self.maxPressTime) {
        
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        // 结束
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        __block float time = self.hasTouchTime;
        if (self.endLongPressCompleteHandler) {
            NSLog(@"111111");
            self.endLongPressCompleteHandler(time);
        }
    }
}

-(UIView *)currentView
{
    if (!_currentView) {
        _currentView = [[UIView alloc] initWithFrame:CGRectMake(-self.frame.origin.x, -self.frame.origin.y, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        _currentView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
    }
    return _currentView;
}
@end
