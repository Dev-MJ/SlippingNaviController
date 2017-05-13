Pod::Spec.new do |s|
   s.name = "SlippingNaviController"
   s.version = "0.1.0"
   s.summary = "UINavigationController's popViewController with panGesture"
   s.homepage = "https://github.com/Dev-MJ/SlippingNaviController"
   s.license = { :type => "MIT", :file => "LICENSE" }
   s.author = { "Dev.MJ" => "mr.lucifers@gmail.com" }
   s.source = { :git => "https://github.com/Dev-MJ/SlippingNaviController.git", :tag => s.version.to_s }
   s.source_files = "SlippingNaviController/*.swift"
   s.frameworks = "UIKit"
   s.ios.deployment_target = "9.0"
   s.pod_target_xcconfig = { "SWIFT_VERSION" => "3.0" }
end
