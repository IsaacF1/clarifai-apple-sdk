Pod::Spec.new do |s|
    s.name             = "Clarifai-Apple-SDK"
    s.version          = "3.0.0-beta21"
    s.summary          = "Clarifai Apple SDK."

    s.description      = <<-DESC
                         The Clarifai Apple SDK allows you to bring powerful A.I. to your mobile apps running on the Apple platform.
                         DESC

    s.homepage          = "http://www.clarifai.com"
    s.license           = { :type => 'Proprietary', :file => 'LICENSE'}
    s.author            = { "Clarifai" => "mobile-feedback@clarifai.com" }
    s.source            = { :git => "https://github.com/Clarifai/clarifai-apple-sdk.git", :tag => s.version.to_s }
    s.documentation_url = "https://developer.clarifai.com/docs/"
    s.requires_arc      = true

    s.ios.deployment_target   = "9.0"
    s.ios.vendored_frameworks = 'Clarifai_Apple_SDK.framework'
    s.libraries               = 'c++', 'sqlite3', 'z'
    s.frameworks              = 'Accelerate', 'CoreGraphics', 'Foundation', 'UIKit'
end
