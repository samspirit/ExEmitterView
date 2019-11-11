//
//  ExDownloaderSimulator.h
//  ExEmitterView_Example
//
//  Created by ecarx on 2019/11/11.
//  Copyright © 2019 11873288@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ExDownloaderSimulator;

@protocol ExDownloaderSimulatorDelegate <NSObject>

- (void)simulator:(ExDownloaderSimulator *)simulator didUpdateProgress:(double)progress;

@end

@interface ExDownloaderSimulator : NSObject

@property (nonatomic, weak) id <ExDownloaderSimulatorDelegate> delegate;

- (instancetype)initWithProgressInterval:(NSTimeInterval)progressInterval;

- (void)startDownload;
- (void)cancelDownload;
@end

NS_ASSUME_NONNULL_END
