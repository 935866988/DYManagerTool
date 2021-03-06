#
# Be sure to run `pod lib lint DYManagerTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DYManagerTool'
  s.version          = '0.0.3'
  s.summary          = 'DYManagerTool是对类别的封装'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
DYManagerTool是对类别的封装,方便二次集成使用
                       DESC

  s.homepage         = 'https://github.com/935866988/DYManagerTool.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '935866988@qq.com' => 'liangyongsheng@danyuantech.com' }
  s.source           = { :git => 'https://github.com/935866988/DYManagerTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'DYManagerTool/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DYManagerTool' => ['DYManagerTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'MBProgressHUD', '~> 1.1.0'
end
