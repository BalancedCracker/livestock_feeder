# Livestock Feeder

[README 日本語](README.md)

![Image Art](pack.png)

Have you ever dreamed of running a quiet little farm?

A place where the cows, the sheep — and you — can all take it easy.
Only, looking after livestock turns out to be rather more work than it looks.

Worry not. This data pack is here to help.
Leave the feeding to the **golden scarecrow** standing out in your pasture.
You will never get to see it, sadly, but it is out there working away all the same.

Livestock Feeder is a data pack that adds an automatic feeding machine for your farm animals.

Just **place a crafted "Livestock Feeder"** and load it with the right feed. That's it.
No redstone and no other power source required.

The data pack only needs to be installed on the server. **Clients can join with an unmodified vanilla game.**

---

## Requirements

| Item | Value |
|---|---|
| Minecraft Java Edition | 26.1 to 26.2 (mainly tested on 26.1.2) |
| Data pack format | `min_format: 101` / `max_format: 107` |
| Install location | Server only (nothing to install on the client) |

This is not a mod, so no client-side installation is needed. It does not use a resource pack either.

## Supported animals and feed

| Animal | Feed |
|---|---|
| Cow | Wheat |
| Mooshroom | Wheat |
| Sheep | Wheat |
| Pig | Carrot / Potato / Beetroot |
| Rabbit | Carrot / Golden Carrot / Dandelion |
| Chicken | Seeds (wheat, beetroot, melon, pumpkin, and so on) |

Nether animals such as Hoglins are not supported, and there are no plans to add them.

---

## Installation

Put the `livestock_feeder` folder into `<world>/datapacks/`. For an existing world, run `/reload` afterwards.

For a new world, install and enable the data pack from the world creation screen, then start playing as usual.

```
<world>/datapacks/livestock_feeder/
├── pack.mcmeta
├── pack.png
└── data/
```

If you would rather install it as a zip, make sure **`pack.mcmeta` sits at the root of the archive**.

Zipping the repository folder itself puts everything one level deeper, and Minecraft will not load it.

```sh
cd livestock_feeder && zip -r ../livestock_feeder.zip . -x '.git/*' -x 'datapack.config.json'
```

---

## How to use

### 1. Craft it

![Recipe of Livestock Feeder](recipe.png)

- Ender Pearl × 2
- Dropper × 1
- Golden Shovel × 2
- Golden Chestplate × 1
- Golden Leggings × 1
- Repeater × 2

The recipe unlocks in your recipe book once you are **holding both an Ender Pearl and a Dropper**.

### 2. Place it

Place the Livestock Feeder like any other block.

If you hear a beacon activating and see green particles, it registered correctly.

### 3. Load it with feed

Right-click the Livestock Feeder to open it, then put in the feed for whichever animals you want to raise.

While it has feed inside, it automatically feeds animals within 4 blocks.
**Green particles rise from a Livestock Feeder that still has feed**, so you can see at a glance whether it needs a refill.

You can mix several kinds of feed in the same Livestock Feeder. Each animal gets the feed it needs.
You can also pipe feed in with a hopper, exactly like a normal dropper.

### 4. Remove it

Break the Livestock Feeder like any other block.

It drops as an item, so you can pick it up and place it somewhere else.

Because of how the internals work, green particles may linger for up to 30 seconds afterwards.

---

## Known limitations

- **Selectors only search the current dimension.** Scheduled functions run in the Overworld context, so a Livestock Feeder placed in the Nether or the End is never visited.
- **It stops in unloaded chunks**, exactly like a hopper or a dropper. Nothing multiplies behind your back while you are away.
- **The overall population is counted once at the start of each cycle.** Animals born during that cycle are not counted until the next one.
- **When several babies of the same species are nearby, which one gets fed depends on entity iteration order**, not on distance. The same individual tends to keep being picked until it grows up — which in practice means they mature one at a time.
- **Breeding is not attributed to any player.** Because love mode is set through NBT, `LoveCause` stays empty and these pairings never count toward breeding advancements or the "Animals Bred" statistic. (Experience orbs still drop, just like vanilla.)

---

## Going deeper

How it works inside, how to tune it, and what to know before modifying it are all collected in [DETAILS.en.md](DETAILS.en.md).

| Chapter | What is in it |
|---|---|
| [How it behaves](DETAILS.en.md#how-it-behaves) | The order of checks in one cycle, and how growth and breeding work |
| [Tuning](DETAILS.en.md#tuning) | Where to change the interval, range and density limits, plus notes on feed consumption |
| [Adding another animal](DETAILS.en.md#adding-another-animal) | Steps to support a new species |
| [Checking that it works](DETAILS.en.md#checking-that-it-works) | How to read the counters from `/function feeder:debug` |
| [Development notes](DETAILS.en.md#development-notes) | Pitfalls worth knowing about before you modify this |
| [File layout](DETAILS.en.md#file-layout) | What each file does, and how placement and activation work |

---

## License

Livestock Feeder is licensed under the BSD Zero Clause License.
See the [LICENSE](LICENSE.md) file for details.

Note that the Minecraft items and blocks depicted in `pack.png` and `recipe.png`
are the property of Mojang Studios and are not covered by that license.
Those images are used in accordance with Mojang Studios' usage guidelines.

Minecraft is a trademark of Mojang Studios.
This project is not affiliated with Mojang Studios or Microsoft.
