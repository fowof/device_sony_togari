
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

      ifdef LOCAL_PROGUARD_ENABLED

      ### add start

      _ppf_args  := $(legacy_proguard_flags) $(common_proguard_flags) $(LOCAL_PROGUARD_FLAGS)
      _ppf_nargs := $(words $(_ppf_args))
      _ppf_idxs  := $(shell seq 1 $(_ppf_nargs))
      _ppf_fidxs := $(filter-out 1,$(_ppf_idxs))

      _ppf_incidxs := $(foreach i,$(_ppf_idxs),$(if $(filter -include,$(word $(i),$(_ppf_args))),$(i),))
      _ppf_incfidxs := $(foreach i,$(_ppf_incidxs),$(word $(i),$(_ppf_fidxs)))
      _ppf_incfiles := $(sort $(foreach i,$(_ppf_incfidxs),$(word $(i),$(_ppf_args))))
      _ppf_nonincidxs := $(filter-out $(_ppf_incidxs) $(_ppf_incfidxs),$(_ppf_idxs))

      _ppfs := $(foreach i,$(_ppf_nonincidxs),$(word $(i),$(_ppf_args)))
      _ppfs += $(addprefix -include ,$(_ppf_incfiles))

      _ppfs := $(filter-out -dontshrink -dontobfuscate -dontoptimize,$(_ppfs))
      _ppfs += $(sort $(filter -dontshrink -dontobfuscate -dontoptimize,$(_ppf_args)))

      ### add end

        $(built_dex_intermediate): PRIVATE_EXTRA_INPUT_JAR := $(extra_input_jar)
        $(built_dex_intermediate): PRIVATE_PROGUARD_FLAGS := $(_ppfs)
      #	$(built_dex_intermediate): PRIVATE_PROGUARD_FLAGS := $(legacy_proguard_flags) $(common_proguard_flags) $(LOCAL_PROGUARD_FLAGS)
        $(built_dex_intermediate): PRIVATE_PROGUARD_DICTIONARY := $(proguard_dictionary)
        $(built_dex_intermediate) : $(full_classes_pre_proguard_jar) $(extra_input_jar) $(my_proguard_sdk_raise) $(common_proguard_flag_files) $(proguard_flag_files) $(legacy_proguard_lib_deps) $(R8_COMPAT_PROGUARD)
      	$(transform-jar-to-dex-r8)
      else # !LOCAL_PROGUARD_ENABLED
        $(built_dex_intermediate): PRIVATE_D8_LIBS := $(full_java_bootclasspath_libs) $(full_shared_java_header_libs)
        $(built_dex_intermediate): $(full_java_bootclasspath_libs) $(full_shared_java_header_libs)
        $(built_dex_intermediate): $(full_classes_pre_proguard_jar) $(DX) $(ZIP2ZIP)
      	$(transform-classes.jar-to-dex)
      endif
