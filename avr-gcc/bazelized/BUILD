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

# cc_test(
#         name = "unit/" + unit_name,
#         srcs = glob([
#             "mcu/uartboot.cpp",
#             "mcu/uartboot.h",
#             "mcu/config.h",
#             "mcu/testing_helper.h",
#             "test/mcu/uartboot_testing_implementations.cpp",
#             "test/mcu/unit/" + unit_name + ".cpp",
#         ]),
#         copts = DEFAULT_TEST_COMPILE_OPTIONS,
#         includes = [
#             "mcu",
#         ],
#         linkopts = DEFAULT_TEST_LINK_OPTIONS,
#         tags = ["unit"],
#         deps = DEFAULT_TEST_DEPS + [
#             "@avr-bootloader-common",
#         ],
#     )

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
