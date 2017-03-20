#
# Copyright (C) 2017 The LR.Team -gesangtome.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Release name -gesangtome@foxmail.com
PRODUCT_RELEASE_NAME := nova

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/Huawei/nova/device_nova.mk)

## Device identifier. This must come after all inclusions
BOARD_VENDOR := nova
PRODUCT_BRAND := HUAWEI
PRODUCT_DEVICE := nova
PRODUCT_NAME := cm_nova
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_MODEL := nova
TARGET_VENDOR := HUAWEI
