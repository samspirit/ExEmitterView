//
//  ExCustomViewController.m
//  ExEmitterView_Example
//
//  Created by ecarx on 2019/11/11.
//  Copyright © 2019 11873288@qq.com. All rights reserved.
//

#import "ExCustomViewController.h"
#import "ExDownloaderSimulator.h"
#import <ExEmitterView/ExEmitterView.h>

@interface ExCustomViewController ()<ExDownloaderSimulatorDelegate,ExDownloadButtonDelegate>
// 下载按钮
@property (nonatomic, strong) ExDownloadButton *downloadButton;
// 等待下载速度
@property (nonatomic, strong) ExDownloaderSimulator *downloaderSimulator;

@end

@implementation ExCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.downloaderSimulator = [[ExDownloaderSimulator alloc] initWithProgressInterval:0.05];
    self.downloaderSimulator.delegate = self;
    
    self.downloadButton = [[ExDownloadButton alloc] initWithFrame:CGRectMake(100, 100, 100, 35)];
    self.downloadButton.delegate = self;
    [self.view addSubview:self.downloadButton];
    
    [self.downloadButton.downloadedButton cleanDefaultAppearance];
    [self.downloadButton.downloadedButton setTintColor:UIColor.redColor];
    [self.downloadButton.downloadedButton setTitle:@"delete" forState:UIControlStateNormal];
    [self.downloadButton.downloadedButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.downloadButton.downloadedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    self.downloadButton.stopDownloadButton.tintColor = [UIColor blackColor];
    self.downloadButton.stopDownloadButton.filledLineStyleOuter = NO;
    
    self.downloadButton.waitingView.tintColor = [UIColor orangeColor];
    self.downloadButton.waitingView.radius = 24.f;
    self.downloadButton.waitingView.emptyLineRadians = 2.f;
    self.downloadButton.waitingView.spinTime = 3.f;
    
    [self.downloadButton.startDownloadButton cleanDefaultAppearance];
    [self.downloadButton.startDownloadButton setImage:[UIImage imageNamed:@"download_default"] forState:UIControlStateNormal];
    [self.downloadButton updateStartDownloadButtonText:@""];
    [self.downloadButton updateDownloadedButtonText:@"已下载"];
}

#pragma mark - PKDownloadButtonDelegate

-(void)downloadButtonTapped:(ExDownloadButton *)downloadButton currentState:(ExDownloadButtonState)state
{
    switch (state) {
        case kExDownloadButtonState_Start:
            NSLog(@"StartDownload");
            self.downloadButton.state = kExDownloadButtonState_Waiting;
            // 下载时间开始计时
            [self afterStartDownload];
            break;
        case kExDownloadButtonState_Waiting:
            NSLog(@"Pending");
//            取消定时器，取消下载
            self.downloadButton.state = kExDownloadButtonState_Start;
            break;
        case kExDownloadButtonState_Download:
            NSLog(@"Downloading");
            [self.downloaderSimulator cancelDownload];
            self.downloadButton.state = kExDownloadButtonState_Start;
            break;
        case kExDownloadButtonState_Done:
            NSLog(@"Downloaded");
//            self.downloadButton.state = kExDownloadButtonState_Start;
            break;
        default:
            NSAssert(NO, @"unsupported state");
            break;
    }
}

-(void)afterStartDownload
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.downloadButton.state = kExDownloadButtonState_Download;
        [self.downloaderSimulator startDownload];
    });
}

#pragma mark - DownloaderSimulatorDelegate
-(void)simulator:(ExDownloaderSimulator *)simulator didUpdateProgress:(double)progress
{
    NSLog(@"%f",progress);
    if (simulator == self.downloaderSimulator) {
        self.downloadButton.stopDownloadButton.progress = progress;
        if (progress >= 1) {
            self.downloadButton.state = kExDownloadButtonState_Done;
        }
    }
}
@end
