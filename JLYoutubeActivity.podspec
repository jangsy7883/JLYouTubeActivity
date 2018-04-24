Pod::Spec.new do |s|
  s.name         = "JLYoutubeActivity"
  s.version      = "2.0"
  s.summary      = "JLYoutubeActivity"
  s.homepage     = "https://github.com/jangsy7883/JLYoutubeActivity"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "hmhv" => "jangsy7883@gmail.com" }
  s.source       = { :git => "https://github.com/jangsy7883/JLYoutubeActivity.git", :tag => s.version }
  s.source_files = 'JLYoutubeActivity/*.{swift}'
  s.resources = 'JLYoutubeActivity/*.bundle'
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
end
