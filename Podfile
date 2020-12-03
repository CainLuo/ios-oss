source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '12.0'
use_frameworks!
inhibit_all_warnings!

target 'ios-oss' do

  # Network
  pod 'Moya/RxSwift' # https://github.com/Moya/Moya
  pod 'Moya-ObjectMapper/RxSwift' # https://github.com/bmoliveira/Moya-ObjectMapper

  # RxSwift
  pod 'RxSwiftExt' # https://github.com/RxSwiftCommunity/RxSwiftExt
  pod 'RxGesture' # https://github.com/RxSwiftCommunity/RxGesture
  pod 'NSObject+Rx' # https://github.com/RxSwiftCommunity/NSObject-Rx
  pod 'RxSwift' # https://github.com/ReactiveX/RxSwift
  pod 'RxCocoa' # https://github.com/ReactiveX/RxSwift
  pod 'RxDataSources' # https://github.com/RxSwiftCommunity/RxDataSources
  pod 'Action' # https://github.com/RxSwiftCommunity/Action
  pod 'RxWebKit' # https://github.com/RxSwiftCommunity/RxWebKit
  pod 'RxOptional' # https://github.com/RxSwiftCommunity/RxOptional
  
  # ShareSDKs
#  pod 'mob_sharesdk'#, '~> 4.3.13.1'
#  pod 'mob_sharesdk/ShareSDKPlatforms/Facebook'
#  pod 'mob_sharesdk/ShareSDKPlatforms/Apple'

  # Log
  pod 'XCGLogger' # https://github.com/DaveWoodCom/XCGLogger

  # Image
  pod 'SDWebImage' # https://github.com/SDWebImage/SDWebImage

  # Localize
  pod 'Localize-Swift' # https://github.com/marmelroy/Localize-Swift
  
  # Tools
  pod 'SwifterSwift' # https://github.com/SwifterSwift/SwifterSwift

  # UI
  pod 'STPopup'# https://github.com/kevin0571/STPopup.git
  pod 'MJRefresh' # https://github.com/CoderMJLee/MJRefresh.git
  pod 'HBDNavigationBar' # https://github.com/listenzz/HBDNavigationBar
  pod 'MBProgressHUD' # https://github.com/jdg/MBProgressHUD

  # Auto Layout
  pod 'SnapKit' # https://github.com/SnapKit/SnapKit

  # WKWebView Javascript
  pod 'WKWebViewJavascriptBridge' # https://github.com/Lision/WKWebViewJavascriptBridge
  
  # UI Test Tools
  pod 'LookinServer', :configurations => ['Debug', 'Preview', 'Live']
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
    end
end
