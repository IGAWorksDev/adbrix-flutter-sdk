#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint adbrix_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'adbrix_plugin'
  s.version          = '1.1.0'
  s.summary          = 'This is official Flutter plugin for Adbrix 2.0 SDK.'
  s.description      = <<-DESC
This is official Flutter plugin for Adbrix 2.0 SDK.
                       DESC
  s.homepage         = 'https://adbrix.gitbook.io'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'IGAWORKS' => 'dfn_dev@igaworks.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'

  s.dependency 'Flutter'
  s.dependency 'adbrix2.0', '3.0.3'
  
  s.platform = :ios, '12.0'
  

end
