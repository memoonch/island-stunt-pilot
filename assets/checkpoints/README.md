# Checkpoint texture v1

Enhanced atlas: `checkpoint-gold-v1.png` (1254x1254). Original 256x256 atlas preserved under `original/`. The ring mesh, collision size, checkpoint logic and direction arrows are unchanged. Gold and charcoal material shading is baked into the texture; no extra shader passes are introduced.

Run `Restore-Original-Checkpoints.cmd` or `Use-Enhanced-Checkpoints.cmd` in the workspace root, then refresh. Each command updates the local/website manifests and upload ZIP. Temporary comparison URLs use `?checkpoints=original` or `?checkpoints=enhanced`.

Created using the built-in image generation tool, editing the original UV atlas. Final prompt:

Use case: precise-object-edit. Edit target: supplied 256x256 UV texture atlas of a checkpoint ring for a flight game. Return an enhanced square texture atlas at 1024x1024 or higher. EXACT UV layout invariant: gold surface ONLY occupies x=0 through 73.4% of width and y=0 through 50.4% of height. The entire rest of the texture stays dark charcoal/near black. Preserve these exact boundaries and the vertical gold shading bands at their same proportional positions. Do not depict a ring, torus, icon or object: this must remain a flat UV material atlas. Gold section: rich warm gold metal, broad smooth highlights, restrained brushed finish and dark amber shading, clean polished appearance, no tiny white sparkles, dots, bolts, text, symbols or new seams. Dark regions: deep charcoal metal with smooth subtle wide vertical shading for readable depth, very restrained texture, not pure featureless black. Keep the original broad color blocking, texture island mapping and usable contrast. Opaque image, no transparency.
