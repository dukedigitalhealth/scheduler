
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scheduler/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'activesupport', '4.2.10'
  spec.add_dependency 'chronic'
  spec.add_dependency 'ice_cube'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'timecop'

  spec.authors       = ['Martin Streicher']
  spec.bindir        = 'exe'
  spec.email         = ['martin.streicher@gmail.com']
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.homepage      = 'TODO: Put your gem website or public repo URL here.'
  spec.license       = 'MIT'
  spec.name          = 'scheduler'
  spec.require_paths = ['lib']
  spec.summary       = %q{Manage recurring schedules in UTC}
  spec.version       = Scheduler::VERSION
end
