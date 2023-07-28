require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

# Detect if new arch is enabled
new_arch_enabled = ENV['RCT_NEW_ARCH_ENABLED'] == '1'

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::Spec.new do |s|
  s.name            = "DetectMaestro"
  s.version         = package["version"]
  s.summary         = package["description"]
  s.description     = package["description"]
  s.homepage        = package["homepage"]
  s.license         = package["license"]
  s.platforms       = { :ios => "11.0" }
  s.author          = package["author"]
  s.source          = { :git => package["repository"], :tag => "#{s.version}" }
  s.source_files    = "ios/**/*.{h,m,mm,swift}"


  # RN >= 0.71
  # check source code for more context
  # https://github.com/facebook/react-native/blob/0.71-stable/scripts/react_native_pods.rb#L172#L180
  if defined?(install_modules_dependencies)
    if new_arch_enabled
      s.pod_target_xcconfig = {
        "DEFINES_MODULE" => "YES",
        "SWIFT_OBJC_INTERFACE_HEADER_NAME" => "DetectMaestro-Swift.h",
        # This is handy when we want to detect if new arch is enabled in Swift code
        # and can be used like:
        # #if DETECT_MAESTRO_NEW_ARCH_ENABLED
        # // do sth when new arch is enabled
        # #else
        # // do sth when old arch is enabled
        # #endif
        "OTHER_SWIFT_FLAGS" => "-DDETECT_MAESTRO_NEW_ARCH_ENABLED"
      }
    else
      s.pod_target_xcconfig = {
        "DEFINES_MODULE" => "YES",
        "SWIFT_OBJC_INTERFACE_HEADER_NAME" => "DetectMaestro-Swift.h"
      }
    end

    install_modules_dependencies(s)
  # RN <= 0.70
  else
    if new_arch_enabled
      s.compiler_flags  = folly_compiler_flags

      s.pod_target_xcconfig    = {
        "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\"",
        "DEFINES_MODULE" => "YES",
        "SWIFT_OBJC_INTERFACE_HEADER_NAME" => "DetectMaestro-Swift.h",
        "OTHER_SWIFT_FLAGS" => "-DDETECT_MAESTRO_NEW_ARCH_ENABLED"
      }

      s.dependency "React-Core"
      s.dependency "React-RCTFabric" # This is for Fabric Native Component
      s.dependency "React-Codegen"
      s.dependency "RCT-Folly"
      s.dependency "RCTRequired"
      s.dependency "RCTTypeSafety"
      s.dependency "ReactCommon/turbomodule/core"
    else
      s.pod_target_xcconfig = {
        "DEFINES_MODULE" => "YES",
        "SWIFT_OBJC_INTERFACE_HEADER_NAME" => "DetectMaestro-Swift.h"
      }
      s.dependency "React-Core"
    end
  end
end
