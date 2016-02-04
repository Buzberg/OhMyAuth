Pod::Spec.new do |s|
  s.name             = "OhMyAuth"
  s.summary          = "A short description of OhMyAuth."
  s.version          = "0.1.0"
  s.homepage         = "https://github.com/hyperoslo/AzureOAuth"
  s.license          = 'MIT'
  s.author           = { "Hyper Interaktiv AS" => "ios@hyper.no" }
  s.source           = {
    :git => "https://github.com/hyperoslo/AzureOAuth.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.requires_arc = true
  s.ios.source_files = 'Sources/{iOS,Shared}/**/*'
  s.osx.source_files = 'Sources/{Mac,Shared}/**/*'

  # s.ios.frameworks = 'UIKit', 'Foundation'
  # s.osx.frameworks = 'Cocoa', 'Foundation'

  # s.dependency 'Whisper', '~> 1.0'
  s.dependency 'Sugar'
  s.dependency 'Keychain'
  s.dependency 'Alamofire'
  s.dependency 'JWTDecode.swift'
end
