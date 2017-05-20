Pod::Spec.new do |s|

  s.license      = "MIT"
  s.author       = { "qqc" => "20599378@qq.com" }
  s.platform     = :ios, "8.0"
  s.requires_arc  = true

  s.name         = "QqcFramework"
  s.version      = "1.0.20"
  s.summary      = "QqcFramework"
  s.homepage     = "https://github.com/xukiki/QqcFramework"
  s.source       = { :git => "https://github.com/xukiki/QqcFramework.git", :tag => "#{s.version}" }
  
  s.source_files = 'QqcFramework/*.{h,m}'

  #s.subspec 'Controller' do |ss|
  #  ss.source_files = 'QqcFramework/QqcBaseViewController.{h,m}','QqcFramework/QqcFetchViewController.{h,m}'
  #end

  #s.subspec 'DataController' do |ss|
  #  ss.source_files = 'QqcFramework/QqcDataController.{h,m}'
  #end

  #s.subspec 'ViewModel' do |ss|
  #  ss.source_files = 'QqcFramework/QqcViewModel.{h,m}'
  #end

  s.dependency "QqcLog"
  s.dependency "QqcComFuncDef"
  s.dependency "QqcProgressHUD"
  s.dependency "QqcUtilityUI"
  s.dependency "QqcRequest"

end
