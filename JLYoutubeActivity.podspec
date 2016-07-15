@version = "1.1"
Pod::Spec.new do |s|
  s.name         = "JLYoutubeActivityDemo"
  s.version      = @version
  s.summary      = "JLYoutubeActivityDemo"
  s.homepage     = "https://github.com/jangsy7883/JLYoutubeActivityDemo"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "hmhv" => "jangsy7883@gmail.com" }
  s.source       = { :git => "https://github.com/jangsy7883/JLYoutubeActivityDemo", :tag => @version }
  s.source_files = 'JLYoutubeActivityDemo/*.{h,m}'
  s.resources = 'JLYoutubeActivityDemo/*.bundle'
  s.requires_arc = true
  s.ios.deployment_target = '7.0'
end