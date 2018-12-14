ARCHS = armv7 arm64
export TARGET_CC=/Library/Developer/Toolchains/Hikari.xctoolchain/usr/bin/clang
export TARGET_CXX=/Library/Developer/Toolchains/Hikari.xctoolchain/usr/bin/clang++
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MUGKit
MUGKit_CFLAGS += -mllvm -enable-allobf
MUGKit_CCFLAGS += -mllvm -enable-allobf
MUGKit_FILES = $(wildcard src/*.xm) $(wildcard lua/*.c)
MUGKit_CFLAGS = -I ./lua -Wno-deprecated-declarations -Wno-unused-function
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
