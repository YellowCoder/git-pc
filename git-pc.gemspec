# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'git-pc/version'

Gem::Specification.new do |s|
  s.name        = 'git-pc'
  s.version     = GitPc::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Adriano Tadao Sabadini Matsumoto']
  s.email       = 'drianotadao@gmail.com'
  s.homepage    = 'https://github.com/adrianotadao/git-pc'
  s.summary     = 'git shortcut to do push and commit'
  s.description = 'Sometimes execute the basic git commands is very boring and repetitive so, this shortcut will make your job most fast.'
  s.license     = 'MIT'

  s.add_runtime_dependency 'colored', '~> 1.2'
  s.add_runtime_dependency 'grit', '2.5.0'

  s.files        = Dir.glob('{bin,lib}/**/*') + %w(LICENSE README.md)
  s.require_path = 'lib'
  s.executables  = Dir.glob('bin/*').map(&File.method(:basename))
end
