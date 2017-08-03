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

    pod 'Clarifai-Apple-SDK', '3.0.0-beta2'
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

## Start the SDK

The Clarifai SDK is initialized by calling the `startWithAppKey` method. We recommend to start it when your app finishes launching, but that is not absolutely required. And don't worry about hogging the launching of your app. We offload the work to background threads; there should be little to no impact.

**Swift**

```swift
import Clarifai_Apple_SDK

func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    Clarifai.sharedInstance().start(appKey:"<App key goes here>")

    return true
}
```

**Objective-C**

```objective-c
@import Clarifai_Apple_SDK;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[Clarifai sharedInstance] startWithAppKey:@"<App key goes here>"];

    return YES;
}
```

## Learn and do more

Check out our [documentation site](https://developer.clarifai.com/docs/) to learn a lot more about how to bring A.I. to your app.


## Support

Questions? Have an issue? Send us a message at <mobile-feedback@clarifai.com>.


## License

The Clarifai-Apple-SDK is available under a commercial license. See the [LICENSE](https://github.com/Clarifai/clarifai-apple-sdk/blob/master/LICENSE) file for more information.
