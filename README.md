# TWRP/OrangeFox Device Tree for moto g play 2026 (Nevada)

=========================================

The **moto g play 2026** (codenamed **`nevada`**) is a Motorola smartphone powered by the MediaTek Dimensity 6300 platform.

This tree is a **port based on the moto g 5g 2025 (`kansas`) device tree**, with Nevada-specific changes and fixes from the original Nevada tree.

> Built with questionable amounts of caffeine, questionable amounts of debugging, and approximately 47 instances of staring at a build log wondering what the hell just happened. 🗿

## Device specifications

|        Basic | Spec Sheet              |
| -----------: | :---------------------- |
|     Codename | nevada                  |
|          SoC | MediaTek Dimensity 6300 |
|          GPU | Mali-G57 MC2            |
| Architecture | ARM64                   |
|      Display | 720 × 1604              |
|     Recovery | Vendor Boot             |
| Android Base | Android 12.1 TWRP       |

## Features

Works:

* [x] ADB
* [x] Display
* [x] Touchscreen
* [x] Decryption
* [x] Fastbootd
* [x] Flashing
* [x] MTP
* [x] Sideload
* [x] USB OTG
* [x] Vibrator
* [ ] Flashlight

## Build

First initialize the minimal TWRP AOSP tree:

```
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -j$(nproc --all)
```

Then add the Nevada device tree.

Build with:

```
source build/envsetup.sh
lunch twrp_nevada-eng
mka vendorbootimage -j$(nproc --all)
```

The resulting image can be found at:

```
out/target/product/nevada/vendor_boot.img
```

## Flashing

Boot the device into bootloader mode and flash:

```
fastboot flash vendor_boot vendor_boot.img
```

Then reboot the device.

> **Developer note:** If the build fails, inspect the log before blaming the compiler. If the compiler is innocent, blame the fstab. If the fstab is innocent, blame the DTB. If everything looks correct, acquire a Monster and stare at the terminal until the answer appears. 🗿

## Port Information

This device tree is based on the **moto g 5g 2025 (`kansas`) TWRP tree**.

Nevada-specific changes include:

* Nevada device configuration
* Nevada prebuilt kernel and DTB
* Nevada vendor configuration
* Nevada touchscreen/calibration configuration
* Nevada-specific recovery fstab
* Nevada display and haptic configuration
* Fixes carried over from the original Nevada tree

Special thanks to **[@evoxdl](https://github.com/evoxdl)** for fixes and work incorporated into the port.

## Development

This tree was built through the highly scientific process of:

1. Change one thing.
2. Build.
3. Watch GitHub Actions explode.
4. Drink something caffeinated.
5. Stare at the fstab.
6. Change something else.
7. Somehow make touchscreen work.
8. Immediately break FastbootD.
9. Repeat until it boots. 😂

No cigarettes were harmed in the making of this device tree.

The developer, however, may have stared at the terminal long enough to consider them. 🚬🗿

## Special Thanks

* **[@Dip184](https://github.com/Dip184)** — for the decryption guide and all the work
* **[@koaaN](https://github.com/koaaN)** — for the security patch level sync script
* **[@perilouspike](https://github.com/perilouspike)** — for the base device tree
* **[@evoxdl](https://github.com/evoxdl)** — for fixes and contributions incorporated into this port
* **TeamWin Recovery Project (TWRP)** — for the recovery framework and `prepdecrypt` mechanism this build's decrypt fix is based on

---

### 🗿 CRONCH BUILD STATUS

**Display:** WORKS
**Touch:** WORKS
**Vibration:** WORKS
**ADB:** WORKS
**Fstab:** *probably*
**FastbootD:** *we are about to find out*
**GitHub Actions:** 💀
**Build developer:** 🧍 + terminal + questionable caffeine consumption
**Compiler:** **NOT ALLOWED TO CRONCH**
