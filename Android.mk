#
# Copyright (C) 2017 The LR.Team -gesangtome
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

include $(call all-makefiles-under,$(LOCAL_PATH))
include $(CLEAR_VARS)

IMS_LIBS := libimscamera_jni.so libimsmedia_jni.so

IMS_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR_APPS)/ims/lib/arm64/,$(notdir $(IMS_LIBS)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "IMS lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(IMS_SYMLINKS)

# Create a link for the WCNSS config file {LR.Team -gesangtome}
$(shell mkdir -p $(TARGET_OUT)/etc/firmware/wlan/prima; \
#	ln -sf /persist/WCNSS_qcom_cfg.ini \
#		$(TARGET_OUT)/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini; \
        ln -sf /persist/WCNSS_wlan_dictionary.dat \
                $(TARGET_OUT)/etc/firmware/wlan/prima/WCNSS_wlan_dictionary.dat \
        ln -sf /persist/WCNSS_qcom_wlan_nv.bin \
                $(TARGET_OUT)/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin)

# Create symbolic links for Qualcomm {LR.Team -gesangtome}
$(shell mkdir -p $(TARGET_OUT)/vendor/lib; \
#        rm -rf $(TARGET_OUT)/vendor/lib/libEGL_adreno.so; \
        ln -sf /system/vendor/lib/egl/libEGL_adreno.so; \
        $(TARGET_OUT)/vendor/lib/libEGL_adreno.so)

$(shell mkdir -p $(TARGET_OUT)/vendor/lib64; \
#        rm -rf $(TARGET_OUT)/vendor/lib64/libEGL_adreno.so; \
        ln -sf /system/vendor/lib64/egl/libEGL_adreno.so; \
        $(TARGET_OUT)/vendor/lib64/libEGL_adreno.so)

# Repair: No rule to make 'libminui_intermediates/events.o' need target: KERNEL_OBJ/usr, stop...
$(shell mkdir -p $(TARGET_OUT)/../obj/KERNEL_OBJ/usr;
# Add by LR.Team -gesangtome

include $(all-subdir-makefiles)
