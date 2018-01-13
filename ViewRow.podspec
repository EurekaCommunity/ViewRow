Pod::Spec.new do |s|
  s.name = 'ViewRow'
  s.version = '0.3.0'
  s.license = 'MIT'
  s.summary = 'A UIView hosting row for use with the Eureka form library'
  s.homepage = 'https://github.com/EurekaCommunity/ViewRow'
  s.source = { :git => 'https://github.com/EurekaCommunity/ViewRow.git' }
  s.ios.deployment_target = '8.0'
  s.ios.frameworks = 'UIKit', 'Foundation'
  s.source_files = 'ViewRow/**/*.swift'
  s.requires_arc = true
  s.author = "Mark Alldritt"
  s.dependencies = {
  	'Eureka' => '>= 4.0.0'
  }
end
