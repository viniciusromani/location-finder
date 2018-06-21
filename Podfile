
# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

def ui_pods
    pod 'Toast-Swift', '~> 3.0.1'
end

def net_pods
    pod 'Moya'
    pod 'Moya/RxSwift'
end

def helper_pods
    pod 'Swinject'
    pod 'SwinjectStoryboard'
    pod 'R.swift'
end

target 'LocationFinder' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for LocationFinder
  ui_pods
  net_pods
  helper_pods

  target 'LocationFinderTests' do
    inherit! :search_paths
    # Pods for testing
  end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.1.0'
        end
    end
end
