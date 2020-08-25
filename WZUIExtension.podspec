Pod::Spec.new do |s|
  s.name             = 'WZUIExtension'
  s.version          = '0.1.5'
  s.summary          = 'A short description of WZUIExtension.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/WZLYiOS/WZUIExtension'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LiuSky' => '327847390@qq.com' }
  s.source           = { :git => 'https://github.com/WZLYiOS/WZUIExtension.git', :tag => s.version.to_s }

  s.static_framework = true
  s.swift_version         = '5.0'
  s.requires_arc = true
  s.ios.deployment_target = '10.0'

  s.source_files = 'WZUIExtension/Classes/**/*'
  s.dependency 'WZNamespaceWrappable', '~> 1.0.0'
end
