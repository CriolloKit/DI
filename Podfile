platform :ios, "8.0"

inhibit_all_warnings!

target "CRDI" do

pod "MAObjCRuntime"
pod "ISMethodSwizzling"

    target "CRDISpecs" do
      pod "Kiwi"
      pod "MAObjCRuntime"
      pod "ISMethodSwizzling"
    end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
        end
    end
end
