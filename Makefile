CONFIG_DIR = config

SRCS = $(shell find $(CONFIG_DIR) -type f)

TARGET = ../zmk/app/build/futaba/zephyr/zmk.uf2

.PHONY: build clean

build: $(TARGET)

$(TARGET): $(SRCS)
	docker exec -w /workspaces/zmk/app -it $(container_name) west build -d build/futaba -b seeeduino_xiao_ble -S studio-rpc-usb-uart -S zmk-usb-logging -- -DSHIELD=futaba -DZMK_CONFIG="/workspaces/zmk-config/config" -DZMK_EXTRA_MODULES="/workspaces/zmk-modules/zmk-pmw3360-driver" -DCONFIG_ZMK_STUDIO=y -DCONFIG_ZMK_STUDIO_LOCKING=n
	docker exec -w /workspaces/zmk/app -it $(container_name) cp build/futaba/zephyr/zmk.uf2 build/futaba.uf2

clean:
	docker exec -it $(container_name) rm -rf /workspaces/zmk/app/build