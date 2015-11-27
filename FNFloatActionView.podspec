Pod::Spec.new do |s|
  s.name             = "FNFloatActionView"
  s.version          = "1.0.0"
  s.summary          = ""
  s.description      = <<-DESC
                       DESC
  s.homepage         = "https://github.com/felix8888/FNFloatActionView"
  s.license          = 'MIT'
  s.author           = { "Felix Niu" => "felix8888.good@gmail.com" }
  s.source           = { :git => "https://github.com/felix8888/FNFloatActionView.git", :tag => s.version.to_s }
  s.requires_arc     = true
  s.platform         = :ios, "8.0"
  
  s.source_files = "Source/*.swift"

end
