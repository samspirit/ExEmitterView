//
//  ExDownloadButton.m
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#define SafeObjClassCast(destClass_, resultObj_, originalObj_) \
destClass_ *resultObj_ = (destClass_ *)originalObj_;\
NSAssert2((resultObj_) == nil || [(resultObj_) isKindOfClass:[destClass_ class]],\
@"Incorrect cast: original object (%@) could not be casted to the destination class (%@)", \
(originalObj_), NSStringFromClass([destClass_ class]))

#define BlockSafeRun(block_, ...) do { if ((block_) != NULL) (block_)(__VA_ARGS__); } while (NO)

#import "ExDownloadButton.h"
#import "NSLayoutConstraint+ExDownloadButton.h"
#import "UIImage+ExDownloadButton.h"

@interface ExDownloadButton()
@property (nonatomic, weak) ExButtonBorder *startDownloadButton;
@property (nonatomic, weak) ExStopDownloadButton *stopDownloadButton;
@property (nonatomic, weak) ExButtonBorder *downloadedButton;
@property (nonatomic, weak) ExWaitingView *waitingView;

@property (nonatomic, strong) NSMutableArray *stateViews;
@end

@implementation ExDownloadButton

#pragma mark - Initialization
-(instancetype)init
{
    if (self = [super init]) {
        [self setupSubView];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubView];
    }
    return self;
}

-(void)setupSubView
{
    [self createSubviews];
    [self addConstraints:[self createConstraints]];
    self.state = kExDownloadButtonState_Start;
    self.backgroundColor = [UIColor clearColor];
}

#pragma mark - Properties
- (void)setState:(ExDownloadButtonState)state {
    _state = state;
    [self.stateViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        SafeObjClassCast(UIView, view, obj);
        view.hidden = YES;
    }];
    
    switch (state) {
        case kExDownloadButtonState_Start:
            self.startDownloadButton.hidden = NO;
            break;
        case kExDownloadButtonState_Waiting:
            self.waitingView.hidden = NO;
            [self.waitingView startSpin];
            break;
        case kExDownloadButtonState_Download:
            self.stopDownloadButton.hidden = NO;
            self.stopDownloadButton.progress = 0.f;
            break;
        case kExDownloadButtonState_Done:
            self.downloadedButton.hidden = NO;
            break;
        default:
            NSAssert(NO, @"unsupported state");
            break;
    }
}

- (void)tintColorDidChange {
    [super tintColorDidChange];
    
    [self updateButton:self.startDownloadButton title:[self.startDownloadButton titleForState:UIControlStateNormal] font:self.startDownloadButton.titleLabel.font];
    [self updateButton:self.downloadedButton title:[self.downloadedButton titleForState:UIControlStateNormal] font:self.downloadedButton.titleLabel.font];
}


#pragma mark - appearance

-(void)updateStartDownloadButtonText:(NSString *)title {
    [self updateButton:self.startDownloadButton title:title];
}

-(void)updateDownloadedButtonText:(NSString *)title {
    [self updateButton:self.downloadedButton title:title];
}

-(void)updateStartDownloadButtonText:(NSString *)title font:(UIFont *)font {
    [self updateButton:self.startDownloadButton title:title font: font];
}

-(void)updateDownloadedButtonText:(NSString *)title font:(UIFont *)font {
    [self updateButton:self.downloadedButton title:title font: font];
}

- (void)updateButton:(UIButton *)button title:(NSString *)title {
    [self updateButton:button title:title font:[UIFont systemFontOfSize:12.f]];
}

- (void)updateButton:(UIButton *)button title:(NSString *)title font:(UIFont *)font {
    if (title == nil) {
        title = @"";
    }
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:self.tintColor forState:UIControlStateNormal];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateHighlighted];
    [button.titleLabel setFont:font];
}

#pragma mark - private methods

- (ExButtonBorder *)createStartDownloadButton {
    ExButtonBorder *startDownloadButton = [ExButtonBorder buttonWithType:UIButtonTypeCustom];
    [startDownloadButton configureDefaultAppearance];
    [self updateButton:startDownloadButton title:@"DOWNLOAD"];
    [startDownloadButton addTarget:self action:@selector(currentButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    return startDownloadButton;
}

- (ExStopDownloadButton *)createStopDownloadButton {
    ExStopDownloadButton *stopDownloadButton = [[ExStopDownloadButton alloc] init];
    [stopDownloadButton.stopButton addTarget:self action:@selector(currentButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    return stopDownloadButton;
}

- (ExButtonBorder *)createDownloadedButton {
    ExButtonBorder *downloadedButton = [ExButtonBorder buttonWithType:UIButtonTypeCustom];
    [downloadedButton configureDefaultAppearance];
    [self updateButton:downloadedButton title:@"REMOVE"];
    [downloadedButton addTarget:self action:@selector(currentButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    return downloadedButton;
}

- (ExWaitingView *)createWaitingView {
    ExWaitingView *waitingView = [[ExWaitingView alloc] init];
    [waitingView addTarget:self action:@selector(currentButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    return waitingView;
}

- (void)currentButtonTapped:(id)sender {
    [self.delegate downloadButtonTapped:self currentState:self.state];
    BlockSafeRun(self.callback, self, self.state);
}

- (void)createSubviews {
    self.stateViews = (__bridge_transfer NSMutableArray *)CFArrayCreateMutable(nil, 0, nil);
    
    ExButtonBorder *startDownloadButton = [self createStartDownloadButton];
    startDownloadButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:startDownloadButton];
    self.startDownloadButton = startDownloadButton;
    [self.stateViews addObject:startDownloadButton];
    
    ExStopDownloadButton *stopDownloadButton = [self createStopDownloadButton];
    stopDownloadButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:stopDownloadButton];
    self.stopDownloadButton = stopDownloadButton;
    [self.stateViews addObject:stopDownloadButton];
    
    ExButtonBorder *downloadedButton = [self createDownloadedButton];
    downloadedButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:downloadedButton];
    self.downloadedButton = downloadedButton;
    [self.stateViews addObject:downloadedButton];
    
    ExWaitingView *waitingView = [self createWaitingView];
    waitingView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:waitingView];
    self.waitingView = waitingView;
    [self.stateViews addObject:waitingView];
}

- (NSArray *)createConstraints {
    NSMutableArray *constraints = [NSMutableArray array];
    [self.stateViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        SafeObjClassCast(UIView, view, obj);
        [constraints addObjectsFromArray:[NSLayoutConstraint constraintsForWrappedSubview:view withInsets:UIEdgeInsetsZero]];
    }];
    return constraints;
}
@end
