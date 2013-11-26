Pod::Spec.new do |s|
  s.name         = "WeChatSDK"
  s.version      = "0.0.2"
  s.summary      = "The Official iOS SDK of WeChat from Tencent."
  s.homepage     = "http://dev.wechatapp.com/"
  s.license      = {
    :type => 'Copyright',
    :text => <<-LICENSE
      Copyright (c) 2012 Tencent. All rights reserved.
      LICENSE
  }
  s.author       = { "Tencent" => "developer@wechatapp.com" }
  s.source       = { :http => "http://dev.wechatapp.com/download/sdk/WeChat_SDK_iOS_en.zip" }
  s.platform     = :ios
  s.source_files = 'SDKExport/WXApiObject.h', 'SDKExport/WXApi.h'
  s.preserve_paths = 'SDKExport/libWeChatSDK.a'
  s.library   = 'WeChatSDK'
  s.xcconfig  =  { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/WeChatSDK/SDKExport"' }
end
