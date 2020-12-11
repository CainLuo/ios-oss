source 'https://github.com/CocoaPods/Specs.git'
source 'https://git.work.yunyugz.com/ios/yypodspec.git'

platform :ios, '12.0'
use_frameworks!
inhibit_all_warnings!

#workspace 'ios-oss.xcworkspace'
#install! 'cocoapods',
#         disable_input_output_paths: true,
#         generate_multiple_pod_projects: true,
#         incremental_installation: true

def sharePods
  
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
  pod 'mob_sharesdk'#, '~> 4.3.13.1'
  pod 'mob_sharesdk/ShareSDKPlatforms/Facebook'
  pod 'mob_sharesdk/ShareSDKPlatforms/Apple'

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
  pod 'DZNEmptyDataSet' # https://github.com/dzenbot/DZNEmptyDataSet
  pod 'JQUnitField' # https://github.com/xiaohange/JQUnitField
  pod 'BRPickerView' # https://github.com/91renb/BRPickerView
  
  # Date
  pod 'DateToolsSwift' # https://github.com/MatthewYork/DateTools
  pod 'SwiftDate' # https://github.com/malcommac/SwiftDate
  
  # Keyboard Manager
  pod 'IQKeyboardManagerSwift' # https://github.com/hackiftekhar/IQKeyboardManager
  
  # Timer
  pod 'Schedule' # https://github.com/luoxiu/Schedule

  # Auto Layout
  pod 'SnapKit' # https://github.com/SnapKit/SnapKit

  # WKWebView Javascript
  pod 'WKWebViewJavascriptBridge' # https://github.com/Lision/WKWebViewJavascriptBridge
  
  # UI Test Tools
  pod 'LookinServer', :configurations => ['Debug']
  
  pod 'OAComponentManagerKit'
  pod 'OAServiceKit'
  pod 'OAGlobalKit'
  pod 'OAExtensionsKit'
  pod 'OANavigatorKit'
  
  pod 'OAMyKit'

end

target 'ios-oss' do
  sharePods
end

post_install do |installer|
#   targets
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
    end
    
    # projects
#    installer.generated_projects.each do |project|
#      project.build_configurations.each do |config|
#        config.build_settings['ENABLE_BITCODE'] = 'YES'
##          if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 12.0
#            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
#            config.build_settings['MACOS_DEPLOYMENT_TARGET'] = '10.15'
##          end
#      end
#      project.targets.each do |target|
#        target.build_configurations.each do |config|
#          config.build_settings['ENABLE_BITCODE'] = 'YES'
##          if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 12.0
#            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
#            config.build_settings['MACOS_DEPLOYMENT_TARGET'] = '10.15'
##          end
#        end
#      end
#    end
end
