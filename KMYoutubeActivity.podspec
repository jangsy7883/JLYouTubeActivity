@version = "1.0.2"
Pod::Spec.new do |s|
  s.name         = "KMYoutubeActivity"
  s.version      = @version
  s.summary      = "KMYoutubeActivity"
  s.homepage     = "https://github.com/jangsy7883/KMYoutubeActivity"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "hmhv" => "jangsy7883@gmail.com" }
  s.source       = { :git => "https://github.com/jangsy7883/KMYoutubeActivity.git", :tag => @version }
  s.source_files = 'KMYoutubeActivity/*.{h,m}','KMYoutubeActivity/KMYouTubeActivity.bundle'
  s.requires_arc = true
  s.ios.deployment_target = '7.0'
end