# Clarifai CHANGELOG

>Upgrade suggestion levels:
>* **LOW**: An upgrade is not needed unless there are new features you want to use
>* **MODERATE**: An upgrade is recommended, but it's not urgent
>* **HIGH**: This is an important release or there is a bug that may affect a subset of users. Upgrade!
>* **CRITICAL**: There is a critical bug affecting _most users_. Upgrade ASAP!

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
