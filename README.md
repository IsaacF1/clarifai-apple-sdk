<img src="https://clarifai.com/static/images/logo.png" width="256">

# Clarifai Apple SDK

Hello and welcome! This is the public repository of the Clarifai SDK for Apple platforms. We currently support iOS, but plans are in the works to expand.

Our vision at Clarifai is to answer every question. And with this SDK we can help you to bring power A.I. to mobile applications. Check our developer's site at [https://developer.clarifai.com](https://developer.clarifai.com) or contact us at <mobile-feedback@clarifai.com> to learn more.

# Getting started

Sign up for a free developer account at: https://developer.clarifai.com/signup/

The Clarifai-Apple-SDK is available via [CocoaPods](https://cocoapods.org/?q=clarifai-apple-sdk) or can be installed manually. Follow the instructions below based on your preference.

## CocoaPods

To integrate the SDK using CocoaPods, specify it in your [Podfile](https://guides.cocoapods.org/syntax/podfile.html):

```ruby
target '<Your Target>' do
    platform :ios, '8.2'
    use_frameworks!

    pod 'Clarifai-Apple-SDK', '3.0.0-beta3'
end
```

> iOS 8.2 is the minimum version the Clarifai SDK supports.

## Manual installation

The best way to stay up-to-date with the latest version of the SDK with a manual installation is to clone our [GitHub repo](https://github.com/Clarifai/clarifai-apple-sdk.git).

```bash
git clone https://github.com/Clarifai/clarifai-apple-sdk.git
```

1. Add the **Clarifai-Apple-SDK.framework** to your project's **Embedded Binaries**.

    * From your Xcode project/workspace go to the project configurations, **General** tab, and click the **+** button under the **Embedded Binaries** section. Navigate to the directory where you cloned the repository abd select the **Clarifai-Apple-SDK.framework**

2. Include the following required dependencies to **Linked Frameworks and Libraries**:

    * `Accelerate.framework`
    * `CoreGraphics.framework`
    * `Foundation.framework`
    * `libc++`
    * `libsqlite3`
    * `libz`
    * `UIKit.framework`

You should be able to build your project and start using the SDK in your project.

## Git LFS

The binary contained in the framework is managed by GitHub using `git-lfs`. Make sure you have it installed on your system.

If you don't have it installed yet, you can find details at: [https://git-lfs.github.com](https://git-lfs.github.com)

## Start the SDK

The Clarifai SDK is initialized by calling the `startWithApiKey` method. We recommend to start it when your app finishes launching, but that is not absolutely required. And don't worry about hogging the launching of your app. We offload the work to background threads; there should be little to no impact.

**Swift**

```swift
import Clarifai_Apple_SDK

func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    Clarifai.sharedInstance().start(apiKey:"<API Key goes here>")

    return true
}
```

**Objective-C**

```objective-c
@import Clarifai_Apple_SDK;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[Clarifai sharedInstance] startWithApiKey:@"<API Key goes here>"];

    return YES;
}
```


## General model availability notifications

Clarifai's *general model* becomes available to the SDK on demand. After you start the SDK, with a valid API Key, for the first time and try to access the *general model*, the SDK will download it in the background and store it locally for future use.

You can be notified on the progress of the availability of the SDK by registering to listen to the following notifications:

| Swift | Objective-C | Description |
|:---:|:---:|:---|
| CAIWillDownloadGeneralModel | CAIWillDownloadGeneralModelNotification | Broadcast right before the SDK begins downloading the general model |
| CAIDidDownloadGeneralModel | CAIDidDownloadGeneralModelNotification | Broadcast right after the general model has been downloaded |
| CAIGeneralModelDidBecomeAvailable | CAIGeneralModelDidBecomeAvailableNotification | Broadcast when the general model has become available to use |

The first two notifications usually happen only once, when you first use the SDK. After being downloaded the *general model* remains persisted on device. The last notification, on the other hand, is broadcast every time the SDK is started.


## Learn and do more

Check out our [documentation site](https://developer.clarifai.com/docs/) to learn a lot more about how to bring A.I. to your app.


## Support

Questions? Have an issue? Send us a message at <mobile-feedback@clarifai.com>.


## License

The Clarifai-Apple-SDK is available under a commercial license. See the [LICENSE](https://github.com/Clarifai/clarifai-apple-sdk/blob/master/LICENSE) file for more information.
