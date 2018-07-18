
Pod::Spec.new do |s|

s.name         = "TS_UIKit"
s.version      = "1.3.7"
s.summary      = "A Lib For UI."
s.description  = <<-DESC
TSUIKit 是一个UI基类 新增push and pop 转场 新增loadingvc
DESC

s.homepage     = "https://github.com/StoneStoneStoneWang/TSUIKit"
s.license      = { :type => "MIT", :file => "LICENSE.md" }
s.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
s.platform     = :ios, "9.0"
s.ios.deployment_target = "9.0"

s.requires_arc = true

s.frameworks = 'UIKit', 'Foundation'

s.source       = { :git => "https://github.com/StoneStoneStoneWang/TSUIKit.git", :tag => "#{s.version}" }

s.source_files = "Code/**/*.{h,m}"

s.dependency 'Masonry'

s.dependency 'JXTAlertManager'

s.dependency 'SVProgressHUD'
end


