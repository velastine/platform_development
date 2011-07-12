LOCAL_PATH:=$(call my-dir)

$(call emugl-begin-host-executable,emulator_test_renderer)
$(call emugl-import,libOpenglRender event_injector)

LOCAL_SRC_FILES := main.cpp

PREBUILT := $(HOST_PREBUILT_TAG)
SDL_CONFIG ?= prebuilt/$(PREBUILT)/sdl/bin/sdl-config
SDL_CFLAGS := $(shell $(SDL_CONFIG) --cflags)
SDL_LDLIBS := $(filter-out %.a %.lib,$(shell $(SDL_CONFIG) --static-libs))

LOCAL_CFLAGS += $(SDL_CFLAGS) -g -O0
LOCAL_LDLIBS += $(SDL_LDLIBS)

ifeq ($(HOST_OS),windows)
LOCAL_LDLIBS += -lws2_32
endif

LOCAL_STATIC_LIBRARIES += libSDL libSDLmain

$(call emugl-end-module)
