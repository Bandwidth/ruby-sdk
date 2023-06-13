Gem::Specification.new do |s|
  s.name = 'bandwidth-sdk'
  s.version = '10.5.0'
  s.summary = 'Bandwidth'
  s.description = 'The official client SDK for Bandwidht\'s Voice, Messaging, MFA, and WebRTC APIs'
  s.authors = ['Bandwidth']
  s.email = 'dx@bandwidth.com'
  s.homepage = 'https://github.com/Bandwidth/ruby-sdk'
  s.license = 'MIT'
  s.add_dependency('logging', '~> 2.3')
  s.add_dependency('faraday', '>= 1.0', '< 3.0')
  s.add_dependency('faraday-follow_redirects', '~> 0.3')
  s.add_dependency('faraday-multipart', '~> 1.0')
  s.add_dependency('faraday-retry', '~> 1.0')
  s.add_dependency('faraday-http-cache', '~> 2.2')
  s.add_dependency('builder', '~> 3.2.4')
  s.add_development_dependency('minitest', '~> 5.14', '>= 5.14.1')
  s.add_development_dependency('minitest-proveit', '~> 1.0')
  s.add_development_dependency('test-unit')
  s.required_ruby_version = ['>= 2.0']
  s.files = Dir['{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  s.require_paths = ['lib']
end
