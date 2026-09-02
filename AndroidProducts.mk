#OrangeFox/TWRP Config
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_vegas.mk \
    $(LOCAL_DIR)/omni_vegas.mk

COMMON_LUNCH_CHOICES := \
    twrp_vegas-user \
    twrp_vegas-userdebug \
    twrp_vegas-eng \
    omni_vegas-user \
    omni_vegas-userdebug \
    omni_vegas-eng
