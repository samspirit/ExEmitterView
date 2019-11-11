//
//  ExDownloaderSimulator.m
//  ExEmitterView_Example
//
//  Created by ecarx on 2019/11/11.
//  Copyright © 2019 11873288@qq.com. All rights reserved.
//

#import "ExDownloaderSimulator.h"

static double progressStep = 0.01;

@interface ExDownloaderSimulator()

@property (strong) NSTimer *timer;
@property (assign) volatile double progress;
@property (assign) NSTimeInterval progressInterval;
@end

@implementation ExDownloaderSimulator

#pragma mark - initialization

- (instancetype)initWithProgressInterval:(NSTimeInterval)progressInterval {
    self = [super init];
    if (self != nil) {
        self.progressInterval = progressInterval;
    }
    return self;
}

#pragma mark - methods

- (void)startDownload {
    self.progress = 0.;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.progressInterval target:self selector:@selector(increaseProgress) userInfo:nil repeats:YES];
}

- (void)cancelDownload {
    self.progress = 0.;
    [self.timer invalidate];
}

- (void)increaseProgress {
    if (1. - self.progress > progressStep) {
        self.progress += progressStep;
    }
    else {
        self.progress = 1.;
        [self.timer performSelector:@selector(invalidate) withObject:nil afterDelay:0];
    }
    [self.delegate simulator:self didUpdateProgress:self.progress];
}
@end
