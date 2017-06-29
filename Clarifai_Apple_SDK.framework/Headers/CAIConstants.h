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

#endif
