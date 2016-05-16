Gem::Specification.new do |spec|
  spec.name                   = "fawsade"
  spec.version                = "1.0.0"
  spec.date                   = "2016-05-16"
  spec.summary                = "Simplified interface for the AWS Ruby SDK"
  spec.description            = "Simplified interface for the AWS Ruby SDK"
  spec.authors                = ["Pedro Gimenez"]
  spec.email                  = ["me@pedro.bz"]
  spec.files                  = Dir["lib/*.rb", "lib/**/*.rb"]
  spec.homepage               = "http://github.com/pedrogimenez/fawsade"
  spec.extra_rdoc_files       = ["README.md"]
  spec.required_ruby_version  = ">= 2.1.0"
  spec.licenses               = ["MIT"]

  spec.add_runtime_dependency "aws-sdk"
end
