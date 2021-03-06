Pod::Spec.new do |s|
s.name             = "MessagAndPhoneAndMail"
s.version          = "1.0.0"
s.summary          = "A demo for sendMessage and calling and sendmail for iOS."
s.description      = <<-DESC
It is a marquee view used on iOS, which implement by Objective-C.
DESC
s.homepage         = "https://github.com/dabing777888/MessagAndPhoneAndMail"
# s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = 'MIT'
s.author           = { "宋丙乾" => "dabing777888@163.com" }
s.source           = { :git => "https://github.com/dabing777888/MessagAndPhoneAndMail.git", :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/NAME'

s.platform     = :ios, '7.0'
# s.ios.deployment_target = '5.0'
# s.osx.deployment_target = '10.7'
s.requires_arc = true

s.source_files = 'MessagAndPhoneAndMail/*'
# s.resources = 'Assets'

# s.ios.exclude_files = 'Classes/osx'
# s.osx.exclude_files = 'Classes/ios'
# s.public_header_files = 'Classes/**/*.h'
s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'

end
