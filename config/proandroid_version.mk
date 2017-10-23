# Copyright (C) 2015-2016 The PROANDROID FIRMWARES.
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

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# PROANDROID Versioning System
PRODUCT_VERSION_MAJOR = o-8.0.0-$(BUILD_ID)
PRODUCT_VERSION_MINOR =R1
PRODUCT_VERSION_MAINTENANCE =0-Dev
ifdef PROANDROID_BUILD_EXTRA
    PROANDROID_POSTFIX := -$(PROANDROID_BUILD_EXTRA)
endif
ifndef PROANDROID_BUILD_TYPE
    PROANDROID_BUILD_TYPE := UNOFFICIAL
    PLATFORM_VERSION_CODENAME := UNOFFICIAL
    PROANDROID_POSTFIX := -$(shell date +"%Y%m%d")
endif


# Set all versions
PROANDROID_VERSION := PROANDROID-$(PRODUCT_VERSION_MAJOR)-$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)
PROANDROID_MOD_VERSION := PROANDROID-$(PRODUCT_VERSION_MAJOR)-$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(PROANDROID_BUILD_TYPE)$(PROANDROID_POSTFIX)-$(PROANDROID_BUILD)

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.proandroid.version=$(PROANDROID_VERSION) \
    ro.proandroid.releasetype=$(PROANDROID_BUILD_TYPE) \
    ro.proandroid.device=$(PROANDROID_BUILD)
