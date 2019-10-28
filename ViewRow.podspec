Pod::Spec.new do |s|
  s.name = 'ViewRow'
  s.version = '0.8'
  s.license = 'MIT'
  s.summary = 'A UIView hosting row for use with the Eureka form library'
  s.homepage = 'https://github.com/EurekaCommunity/ViewRow'
  s.source = { :git => 'https://github.com/EurekaCommunity/ViewRow.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.3'
  s.ios.frameworks = 'UIKit'
  s.source_files = 'ViewRow/**/*.swift'
  s.requires_arc = true
  s.author = "Mark Alldritt"
  s.swift_version = '5.0'
  s.dependencies = {
  	'Eureka' => '>= 5.0.0'
  }
end
