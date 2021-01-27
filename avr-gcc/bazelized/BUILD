load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_test")
load("@avr_tools//tools/avr:hex.bzl", "eeprom", "hex", "listing")

cc_binary(
    name = "uartboot.elf",
    srcs = glob(
        [
            "demo_application.cpp",
        ],
    ),
    copts = ["-mmcu=$(MCU)"],
    tags = ["mcu_binary_file"],
)

cc_test(
    name = "demo_test",
    srcs = glob([
        "demo_test.cpp",
    ]),
    deps = [
        "@gtest",
        "@gtest//:gtest_main",
    ],
)

hex(
    name = "uartboot_hex",
    src = ":uartboot.elf",
    tags = ["mcu_binary_file"],
)

eeprom(
    name = "uartboot_eeprom",
    src = ":uartboot.elf",
    tags = ["mcu_binary_file"],
)

listing(
    name = "uartboot_listing",
    src = ":uartboot.elf",
    tags = ["mcu_binary_file"],
)
