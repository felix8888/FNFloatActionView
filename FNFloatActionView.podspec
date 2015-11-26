Pod::Spec.new do |s|

  s.name         = "FNFloatActionView"
  s.version      = "1.0.0"
  s.summary      = ""
  s.description  = ""

  s.homepage     = "https://github.com/felix8888/FNFloatActionView"
  s.screenshots  = ""
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Felix Niu" => "felix8888.good@gmail.com" }
  s.social_media_url   = "https://www.facebook.com/felix.new.96"

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/felix8888/FNFloatActionView.git", :tag => "1.0.0" }

  s.source_files  = "*.{h,m}"
  public_header_files = "*.h"

  s.frameworks = "UIKit", "Foundation"

  s.requires_arc = true

end
