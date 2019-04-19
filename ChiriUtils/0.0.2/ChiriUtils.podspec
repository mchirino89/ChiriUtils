Pod::Spec.new do |s|
  s.name         = "ChiriUtils"
  s.version      = "0.0.2"
  s.summary      = "Most common Swift helpers/tools are summarized here"

  s.description  = <<-DESC
    The intent behind this library is to centralize all the common methods that
    are rutainly used in any iOS project.
                   DESC

  s.homepage     = "https://github.com/mchirino89/ChiriUtils"
  s.author             = { "Mauricio Chirino" => "mauricio@3codegeeks.com" }
  s.social_media_url   = "http://twitter.com/chirino89m"
  s.platform     = :ios
  s.ios.deployment_target = "11.0"
  s.swift_version = "4.2"
  s.source       = { :git => "https://github.com/mchirino89/ChiriUtils.git", :tag => "#{s.version}" }
  s.source_files = "Library/ChiriUtils/**/*.{swift}"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.framework = "UIKit"

end
