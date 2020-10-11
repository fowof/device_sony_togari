
### build on macOS Catalina

- modify manifest not to remove files for darwin
- modify build/soong/cc/config/x86_darwin_host.go to allow to build on 10.15
- sed must be gsed. date and stat should be GNU ones, but in some cases BSD ones seem to be required.
- install ccache (?)
- modify vendor/lineage/config/BoardConfigKernel.mk
  - set HOSTCC to /usr/bin/clang and HOSTCXX to /usr/bin/clang++
  - install libelf, create [elf.h](https://forum.xda-developers.com/android/general/guide-building-android-kernel-osx-t3431794) and set HOSTCFLAGS to ...
  - comment out PERL5LIB and rename perl in tools-lineage/darwin-x86/bin to perl-rashed
- external/selinux
  - libselinux/Android.bp: move "src/sestatus.c" in cc_defaults.srcs to android target specific src
- extend soft limit of stack size (?)
- modify build/make/core/java.mk to reduce file size of *.dex.rsp

      common_proguard_flag_files := $(sort $(common_proguard_flag_files))
      common_proguard_flag_files := $(filter-out $(common_proguard_flags),$(common_proguard_flag_files))
      common_proguard_flag_files := $(filter-out $(LOCAL_PROGUARD_FLAGS),$(common_proguard_flag_files))



      proguard_flag_files := $(sort $(proguard_flag_files))
      proguard_flag_files := $(filter-out $(common_proguard_flags),$(proguard_flag_files))
      proguard_flag_files := $(filter-out $(LOCAL_PROGUARD_FLAGS),$(proguard_flag_files))
