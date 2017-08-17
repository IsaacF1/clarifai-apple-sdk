//
//  CAIConstants.h
//  Clarifai-Apple-SDK
//
//  Copyright © 2017 Clarifai. All rights reserved.
//

#ifndef Clarifai_Apple_SDK_CAIConstants_h
#define Clarifai_Apple_SDK_CAIConstants_h

#import <Foundation/Foundation.h>

/// Notification broadcasted right before the downloading of the general model from the cloud begins.
extern NSString * const CAIWillDownloadGeneralModelNotification;

/// Notification broadcasted immediately after the general model has been downloaded from the cloud.
extern NSString * const CAIDidDownloadGeneralModelNotification;

/// Notification broadcasted immediately after the general model has become available to use.
extern NSString * const CAIGeneralModelDidBecomeAvailableNotification;

typedef NS_ENUM(NSUInteger, CAILogLevel) {
    /// Nothing is displayed on the console
    CAILogLevelNone = 0,
    /// Only errors are displayed on the console
    CAILogLevelErrors,
    /// Warnings and errors are displayed on the console
    CAILogLevelWarnings,
    /// Debug information is shown, plus warnings and errors
    CAILogLevelDebug,
    /// Detailed information is shown, plus debug, warnings, and errors
    CAILogLevelVerbose
} NS_SWIFT_NAME(LogLevel);

#endif
