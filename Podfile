project 'Telstra_Assignment.xcodeproj'

# Uncomment the next line to define a global platform for your project
 platform :ios, '8.0'
 

# ignore all warnings from all dependencies
inhibit_all_warnings!


target 'Telstra_Assignment' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'AlamofireObjectMapper', '~> 4' 
  pod 'SwiftLint' 
    # Pods for Telstra_Assignment

  target 'Telstra_AssignmentTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Telstra_AssignmentUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end



