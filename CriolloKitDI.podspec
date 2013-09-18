Pod::Spec.new do |s|
  s.name         = "CriolloKitDI"
  s.version      = "0.0.3"
  s.summary      = "Dependency Injection framework for Criollo Kit"

  s.description  = <<-DESC
                Dependency Injection Framework
                   DESC

  s.homepage     = "https://github.com/CriolloKit/DI"

  s.author       = { "CriolloKit" => "thesooth@aol.com" }

  s.platform     = :ios, '6.0'

  s.source       = { :git => "https://github.com/TheSooth/DI", :tag => "#{s.version}"}

  s.source_files  = 'CRDI/Code', 'CRDI/Code/**/*.{h,m}'
  
  s.frameworks = 'Foundation'

  s.requires_arc = true

  s.dependency 'MAObjCRuntime'
  s.dependency 'ISMethodSwizzling'

end