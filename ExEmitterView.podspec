#
# Be sure to run `pod lib lint ExEmitterView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ExEmitterView'
  s.version          = '0.1.2'
  s.summary          = 'A short description of ExEmitterView.'

  s.homepage         = 'https://github.com/samspirit/ExEmitterView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'samspirit' => '11873288@qq.com' }
  s.source           = { :git => 'https://github.com/samspirit/ExEmitterView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ExEmitterView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ExEmitterView' => ['ExEmitterView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
