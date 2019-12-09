//
//  ExLongPressButton.m
//  ExEmitterView
//
//  Created by ecarx on 2019/11/27.
//

#import "ExLongPressButton.h"
#import <AudioToolbox/AudioToolbox.h>
#import "ExLongCircularView.h"
#import "ExLongProgressView.h"

@interface ExLongPressButton()
@property (assign, nonatomic) float hasTouchTime;   // 已经触摸时间
@property (strong, nonatomic) NSTimer *timer;
// 中心的圆形
@property (strong, nonatomic) ExLongCircularView *circularView;
// 边框的进度条
@property (strong, nonatomic) ExLongProgressView *progressView;
// 遮罩层
@property (nonatomic, strong) UIView  *maskView;
@end

@implementation ExLongPressButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubView];
    }
    return self;
}

-(void)setupSubView {
    [self addSubview:self.maskView];
    self.isMaskView = YES;
    self.isVibration = YES;
    self.maskView.hidden = self.isMaskView;
    self.backgroundColor = [UIColor colorWithRed:207/255.0 green:206/255.0 blue:200/255.0 alpha:.8];
    self.layer.cornerRadius = self.frame.size.height/2.0;
    self.progressView = [[ExLongProgressView alloc] initWithFrame:self.bounds];
    [self addSubview:self.progressView];
    self.circularView = [[ExLongCircularView alloc] initWithFrame:self.bounds];
    self.circularView.transform = CGAffineTransformMakeScale(0.75, 0.75);
    [self addSubview:self.circularView];
    self.maxPressTime = 5.0f;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.maskView.hidden = NO;
    self.hasTouchTime = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(drawBottomRect) userInfo:nil repeats:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.maskView.hidden = self.isMaskView;
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
    self.progressView.endAngle = 0;
    
    [UIView animateWithDuration:.35
                     animations:^{
                         self.transform = CGAffineTransformIdentity;
                         self.circularView.transform = CGAffineTransformMakeScale(0.8, 0.8);
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
                             self.circularView.transform = CGAffineTransformMakeScale(0.5, 0.5);
                         }];
        self.progressView.endAngle = M_PI * 2 * ((self.hasTouchTime - 0.5)/(self.maxPressTime - 0.5));
    }
    
    if (self.hasTouchTime > self.maxPressTime) {
        
        if (self.isVibration) {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }
        // 结束
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        __block float time = self.hasTouchTime;
        if (self.endLongPressCompleteHandler) {
            self.endLongPressCompleteHandler(time);
        }
    }
}

#pragma mark - getter && setter
- (void)setTopColor:(UIColor *)topColor {
    self.circularView.backgroundColor = topColor;
}

- (void)setProgressColor:(UIColor *)progressColor {
    self.progressView.progressColor = progressColor;
}
#pragma mark - lazy
-(UIView *)maskView
{
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:CGRectMake(-self.frame.origin.x, -self.frame.origin.y, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        _maskView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
    }
    return _maskView;
}

-(void)dealloc
{
    NSLog(@"%s",__func__);
}
@end
