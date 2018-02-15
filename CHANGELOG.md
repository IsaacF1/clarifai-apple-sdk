# Clarifai CHANGELOG

>Upgrade suggestion levels:
>* **LOW**: An upgrade is not needed unless there are new features you want to use
>* **MODERATE**: An upgrade is recommended, but it's not urgent
>* **HIGH**: This is an important release or there is a bug that may affect a subset of users. Upgrade!
>* **CRITICAL**: There is a critical bug affecting _most users_. Upgrade ASAP!

## 3.0.0-beta15
>Upgrade suggestion: **MODERATE**. Upgrade if you want the SDK to be more proactive in triggering the fetch of the general model

* Changed the default behavior of the SDK to be more proactive in fetching the general model when it is not yet cached locally
* Upgraded the minimum requirement to iOS 9.0
* Internal updates and improvements

## 3.0.0-beta14
>Upgrade suggestion: **HIGH**. Upgrade if you are using concept ids and receiving concept names instead

* Fixed bug where the concept id property was being populated with the respective concept name, when performing predictions using the general model

## 3.0.0-beta13
>Upgrade suggestion: **MODERATE**. Upgrade if you want a faster SDK launch

* Authentication of the SDK happens completely asynchronously and in a non-blocking way
* The SDK now broadcasts a notification (`CAIAuthenticationNotification`) when the authentication state changes or is renewed. Use `CAIAuthenticationTypeKey` to retrive the authentication type from the `userInfo` property of the notification
    ```objective-c
    NSNumber *authenticationTypeNumber = notification.userInfo[CAIAuthenticationTypeKey];

    CAIAuthenticationType authType = (CAIAuthenticationType)[authenticationTypeNumber integerValue];
    ```

* The SDK now broadcasts a notification (`CAIUsageNotification`) as the budget for local operations get used. The budget gets automatically renewed every time the SDK syncs with the cloud. This is for the cases where your app does not sync often with the cloud and you need to manage expectations of your app. Use `CAIUsageLevelKey` and `CAIUsageBudgetKey` to retrive the current usage level and the total budget, respectively
    ```objective-c
    NSNumber *usageLevel = notification.userInfo[CAIUsageLevelKey];

    NSNumber *budget = notification.userInfo[CAIUsageBudgetKey];
    ```

* Commands called between the SDK being initialized and completing its initialization are queued and executed immediately after the initialization is finished
* Fixed a bug where records from the usage table were not being deleted

## 3.0.0-beta12
>Upgrade suggestion: **HIGH**. Upgrade if you had the completion handler from prediction being called multiple times, or if you experienced a crash

* Migration to the new cross-platform persistence layer
* SDK usage analytics. Internal to Clarifai. Anonymous and not shared with third parties
* Fixed the completion handler from prediction being called multiple times
* Fixed a crash with a concept without a name
* Fixed a crash including a null element to a vector

## 3.0.0-beta11

>Upgrade suggestion: **HIGH**. Upgrade if you have seen a crash when predicting

* Fixed a bug that could cause prediction to crash
* Fixed a bug that could cause a Concept to be initialized without _id_ or _name_


## 3.0.0-beta10

>Upgrade suggestion: **HIGH**. Upgrade if you are using beta 9 and need to archive an app with bitcode support

* Fixed a compilation bug that would prevent archiving an app with bitcode support


## 3.0.0-beta9

>Upgrade suggestion: **LOW**. Ninth beta of the SDK.

* New instructions and script for manual installation
* Reduced library size


## 3.0.0-beta8

>Upgrade suggestion: **LOW**. Eighth beta of the SDK.

* New cross platform persistence layer


## 3.0.0-beta7

>Upgrade suggestion: **CRITICAL**. Seventh beta of the SDK.

* Disable code coverage due to a change in behavior in [Xcode 9](https://developer.apple.com/library/content/qa/qa1964/_index.html#//apple_ref/doc/uid/DTS40017675-CH1-INSPECT)


## 3.0.0-beta6

>Upgrade suggestion: **CRITICAL**. Sixth beta of the SDK.

* Fixed a crash caused by corrupted cached models
* Framework compiled with Xcode 9


## 3.0.0-beta5

>Upgrade suggestion: **MODERATE**. Fifth beta of the SDK.

* Network usage can now be constrained to WiFi only (`networkConstraint`)
* Property containing the SDK initialization status (`sdkStatus`)
* Reference app with examples on how to use the SDK


## 3.0.0-beta4

>Upgrade suggestion: **MODERATE**. Fourth beta of the SDK.

* Deprecated the notifications (see [README](https://github.com/Clarifai/clarifai-apple-sdk/blob/master/README.md#general-model-availability-notifications)):
    * `CAIWillDownloadGeneralModelNotification`, `CAIDidDownloadGeneralModelNotification`, and `CAIGeneralModelDidBecomeAvailableNotification`

    in favor of

    * `CAIWillFetchModelNotification`, `CAIDidFetchModelNotification`, and `CAIModelDidBecomeAvailableNotification`
* Fixed issue with downloading remote custom models
* Prevent the SDK from being started more than once
* Internal protobuf improvements


## 3.0.0-beta3

>Upgrade suggestion: **HIGH**. Third beta of SDK.

* Deprecated `start(appKey:)`/`startWithAppKey:` in favor of `start(apiKey:)`/`startWithApiKey:`
* Log level for messages output to the console
* Notifications for fetching and availability of the general model
* Fixed null outputs on predictions
* Fixed `unknown NSNumber`


## 3.0.0-beta2

>Upgrade suggestion: **CRITICAL**. First release of the SDK.

* Fixed a bug that was causing incorrect predictions


## 3.0.0-beta1

>Upgrade suggestion: **HIGH**. First release of the SDK.

* Long term support for class signatures
* Prediction can be done locally on the device or remotely over the network
