Pod::Spec.new do |s|
  s.name         = "SinaWeibo"
  s.version      = "2.4.0"
  s.summary      = "sina weibo sdk of sso and Oauth2.0"
  s.homepage     = "https://github.com/sinaweibosdk/weibo_ios_sdk"
  s.license      = 'MIT (example)'
  s.license      = {
    :type => 'Commercial',
    :text => <<-LICENSE
        Commercial license.
        Please get a license from Tencent before use.
    LICENSE
  }
  s.author       = { "mobileresearch" => "zhzenghui@gmail.com" }
  s.source       = { :git => "https://github.com/sinaweibosdk/weibo_ios_sdk" }
  s.platform     = :ios
  s.source_files = 'libWeiboSDK/*.{h,m}'
  s.resources = "libWeiboSDK/SinaWeibo.bundle"
end
