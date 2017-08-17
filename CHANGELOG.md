# Clarifai CHANGELOG

>Upgrade suggestion levels:
>* **LOW**: An upgrade is not needed unless there are new features you want to use
>* **MODERATE**: An upgrade is recommended, but it's not urgent
>* **HIGH**: This is an important release or there is a bug that may affect a subset of users. Upgrade!
>* **CRITICAL**: There is a critical bug affecting _most users_. Upgrade ASAP!

## 3.0.0-beta3

>Upgrade suggestion: **HIGH**. First release of the SDK.

* Deprecated `start(appKey:)`/`startWithAppKey:` in favor of `start(apiKey:)`/`startWithApiKey:`
* Log level for messages output to the console
* Notifications for download and availability of the general model
* Fixed null outputs on predictions
* Fixed `unknown NSNumber`


## 3.0.0-beta2

>Upgrade suggestion: **CRITICAL**. First release of the SDK.

* Fixed a bug that was causing incorrect predictions


## 3.0.0-beta1

>Upgrade suggestion: **HIGH**. First release of the SDK.

* Long term support for class signatures
* Prediction can be done locally on the device or remotely over the network
