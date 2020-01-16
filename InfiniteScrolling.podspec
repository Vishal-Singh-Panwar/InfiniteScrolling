#
# Be sure to run `pod lib lint InfiniteScrolling.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'InfiniteScrolling'
  s.version          = '1.0.4'
  s.summary          = 'Add infinite scrolling to collection view.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'This pod adds infinite scrolling ability in UICollectionView'.
DESC

  s.homepage         = 'https://github.com/Vishal-Singh-Panwar/InfiniteScrolling'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vishal Singh Panwar' => 'vishal.singh030788@gmail.com' }
  s.source           = { :git => 'https://github.com/Vishal-Singh-Panwar/InfiniteScrolling.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'InfiniteScrolling/Classes/**/*'
  
  # s.resource_bundles = {
  #   'InfiniteScrolling' => ['InfiniteScrolling/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
