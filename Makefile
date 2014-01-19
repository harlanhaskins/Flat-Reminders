ARCHS=armv7 arm64
include theos/makefiles/common.mk

TWEAK_NAME = FlatReminders
FlatReminders_FILES = FlatReminders.xm
FlatReminders_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Reminders"

purge:
	rm *.deb
	rm -rf obj/
	rm -rf _/
