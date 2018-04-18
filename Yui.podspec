Pod::Spec.new do |s|
  s.name = 'Yui'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.summary = 'Use Coordinators, avoid reference cycles'
  s.homepage = 'https://github.com/CallMeSH/Yui/'
  s.authors = { 'Charles-Henri DUMALIN' => 'charles-henri@mobiten.com' }
  s.source = { :git => 'https://github.com/CallMeSH/Yui.git', :tag => s.version }
  s.swift_version = '4.0'

  s.ios.deployment_target = '11.2'

  s.source_files = 'Yui/*.swift'
end
