Gem::Specification.new do |s|
  s.name        = 'xcal'
  s.version     = '1.0.0'
  s.date        = '2013-09-25'
  s.summary     = "xcal displays a japan calendar like cal, ncal"
  s.description = "xcal displays a japan calendar like cal, ncal"
  s.authors     = ["xmisao"]
  s.email       = 'mail@xmisao.com'
  s.files       = ["bin/xcal", "lib/xcal.rb"]
  s.homepage    = 'https://github.com/xmisao/xcal'
	s.executables << 'xcal'
	s.add_dependency('icalendar')
end
