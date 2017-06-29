//
//  Clarifai.h
//  Clarifai-Apple-SDK
//
//  Copyright © 2017 Clarifai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CAIDataModel.h"

@class CAIModel;

@interface Clarifai : NSObject

@property (nonatomic, strong, nonnull, readonly) CAIModel *generalModel;

+ (nonnull instancetype)sharedInstance;

- (void)deleteEntities:(nonnull NSArray<CAIDataModel *> *)entities NS_SWIFT_NAME(delete(entities:));

- (void)loadEntityId:(nonnull NSString *)entityId entityType:(CAIEntityType)entityType completionHandler:(void (^ _Nonnull)(CAIDataModel * _Nullable entity, NSError * _Nullable error))completionHandler NS_SWIFT_NAME(load(entityId:entityType:completionHandler:));

- (void)loadEntityType:(CAIEntityType)entityType range:(NSRange)range completionHandler:(void (^ _Nonnull)(NSArray<CAIDataModel *> * _Nullable entities, NSError * _Nullable error))completionHandler NS_SWIFT_NAME(load(entityType:range:completionHandler:));

- (void)saveEntities:(nonnull NSArray<CAIDataModel *> *)entities NS_SWIFT_NAME(save(entities:));

- (void)startWithAppKey:(nonnull NSString *)appKey NS_SWIFT_NAME(start(appKey:));

@end
