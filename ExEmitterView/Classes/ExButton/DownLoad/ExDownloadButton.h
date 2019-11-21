//
//  ExDownloadButton.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import <UIKit/UIKit.h>
#import "ExStopDownloadButton.h"
#import "ExButtonBorder.h"
#import "ExCircleProgressView.h"
#import "ExWaitingView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ExDownloadButtonState) {
    kExDownloadButtonState_Start,       /// 开始下载
    kExDownloadButtonState_Waiting,     /// 下载之前的等待时间
    kExDownloadButtonState_Download,    /// 正在下载
    kExDownloadButtonState_Done         /// 下载完成
};
@class ExDownloadButton;
typedef void(^DownloadButtonTappedCallback)(ExDownloadButton *downloadButton, ExDownloadButtonState state);
@protocol ExDownloadButtonDelegate <NSObject>
- (void)downloadButtonTapped:(ExDownloadButton *)downloadButton currentState:(ExDownloadButtonState)state;
@end

IB_DESIGNABLE
@interface ExDownloadButton : UIView

@property (nonatomic, weak) id <ExDownloadButtonDelegate> delegate;
@property (nonatomic, copy) DownloadButtonTappedCallback callback;

@property (nonatomic, weak, readonly) ExButtonBorder        *startDownloadButton;
@property (nonatomic, weak, readonly) ExStopDownloadButton  *stopDownloadButton;
@property (nonatomic, weak, readonly) ExButtonBorder        *downloadedButton;
@property (nonatomic, weak, readonly) ExWaitingView         *waitingView;
/// button 状态
@property (nonatomic, assign) ExDownloadButtonState state;
// 设置开始下载的文字
-(void)updateStartDownloadButtonText:(NSString *)title;
-(void)updateStartDownloadButtonText:(NSString *)title font:(UIFont *)font;
// 设置开始完成下载的文字
-(void)updateDownloadedButtonText:(NSString *)title;
-(void)updateDownloadedButtonText:(NSString *)title font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
