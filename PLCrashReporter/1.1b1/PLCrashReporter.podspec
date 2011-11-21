Pod::Spec.new do |s|
  s.name     = 'PLCrashReporter'
  s.version  = '1.1b1'
  s.license  = 'MIT & Apache License, Version 2.0'
  s.summary  = 'In-process CrashReporter framework for the iPhone and Mac OS X'
  s.homepage = 'http://code.google.com/p/plcrashreporter/'
  s.author   = { 'Landon Fuller' => 'landon.j.fuller@gmail.com' }
  s.source   = { :svn => 'http://plcrashreporter.googlecode.com/svn/tags/plcrashreporter-1.1-beta1' }

  s.description = 'Implemented as a in-process fully async-safe signal handler. '                           \
                  'Does not interfere with debugging in gdb. '                                              \
                  'Handles both uncaught Objective-C exceptions and fatal signals (SIGSEGV, SIGBUS, etc). ' \
                  'Backtraces for all active threads are provided. '                                        \
                  'Provides full register state for the crashed thread.'

  s.source_files = FileList['Dependencies/protobuf-2.0.3/src/*.{c,h}', 'Source/*.{h,c,m}', 'Resources/crash_report.proto'].exclude(/Tests\.m$/)
  s.header_dir  = 'CrashReporter'
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '"$(SRCROOT)/PLCrashReporter/Dependencies/protobuf-2.0.3/include"' }
  s.clean_paths = "contrib", "CrashReporter.xcodeproj", "Tools"

  def s.post_install(target_installer)
    target = target_installer.target
    rule = Xcodeproj::Project::PBXBuildRule.new(target_installer.project, nil, {
      'compilerSpec' => 'com.apple.compilers.proxy.script',
      'filePatterns' => '*.proto',
      'fileType' => 'pattern.proxy',
      'isEditable' => '1',
      'outputFiles' => [
        "${DERIVED_FILES_DIR}/${CURRENT_ARCH}/${INPUT_FILE_BASE}.pb-c.c",
        "${DERIVED_FILES_DIR}/${CURRENT_ARCH}/${INPUT_FILE_BASE}.pb-c.h"
      ],
      'script' => "cd \"${INPUT_FILE_DIR}\" && \"${SRCROOT}/PLCrashReporter/Dependencies/protobuf-2.0.3/bin/protoc-c\" --c_out=\"${DERIVED_FILES_DIR}/${CURRENT_ARCH}\" \"${INPUT_FILE_NAME}\""
    })
    target.attributes['buildRules'] << rule.uuid
  end
end
