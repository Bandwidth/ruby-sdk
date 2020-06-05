Gem::Specification.new do |s|
  s.name = 'bandwidth-sdk'
  s.version = '3.3.0'
  s.summary = 'bandwidth'
  s.description = 'Bandwidth\'s set of APIs'
  s.authors = ['APIMatic SDK Generator']
  s.email = 'support@apimatic.io'
  s.homepage = 'https://apimatic.io'
  s.license = 'MIT'
  s.add_dependency('logging', '~> 2.2')
  s.add_dependency('faraday', '~> 0.15')
  s.add_dependency('faraday_middleware', '~> 0.13')
  s.add_dependency('certifi', '~> 2018.1')
  s.add_dependency('faraday-http-cache', '~> 2.0')
  s.add_dependency('builder', '~> 3.2.4')
  s.required_ruby_version = '~> 2.0'
  s.files = Dir['{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  s.require_paths = ['lib']
end
