project 'RNBridgeDemo.xcodeproj'
# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'RNBridgeDemo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for RNBridgeDemo
  pod 'React', :path => './JS/node_modules/react-native', :subspecs => [
    'Core',
    'CxxBridge', # Include this for RN >= 0.47
    'DevSupport', # Include this to enable In-App Devmenu if RN >= 0.43
    'RCTText',
    'RCTNetwork',
    'RCTWebSocket', 
    'RCTLinkingIOS',
    'RCTAnimation',
    'RCTImage'
  ]

    pod "yoga", :path => "./JS/node_modules/react-native/ReactCommon/yoga"
   pod 'DoubleConversion', :podspec => './JS/node_modules/react-native/third-party-podspecs/DoubleConversion.podspec'
   pod 'Folly', :podspec => './JS/node_modules/react-native/third-party-podspecs/Folly.podspec'
end
