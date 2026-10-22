# Plane texture refresh v1

Original texture: `original/174.jpg` (512x512). Enhanced atlas: `plane-rich-v1.png` (1254x1254). The gameplay plane and hangar plane share the atlas; geometry, physics and shaders are unchanged. Generated detail follows the original UV layout and baked shading. This is a texture refresh, not real metallic lighting.

Use `Restore-Original-Plane.cmd` in the workspace root to restore the original texture selection. Use `Use-Enhanced-Plane.cmd` to select the enhanced texture again. Both update the local game manifest, upload folder and website ZIP. Refresh the page afterward. Both texture assets remain available.

Comparison URLs: `/player/recovered.html?plane=original` and `/player/recovered.html?plane=enhanced`. Query selection is temporary and does not change the saved default.

Built-in image generation tool, edit of original atlas. Final prompt:

Use case: precise-object-edit. Edit target: original 512x512 UV texture atlas for a yellow stunt biplane. Produce a sharper 2048x2048 game texture atlas with EXACTLY the same UV layout, island silhouettes, seam locations, stripe boundaries, roundel centers and all parts at the same proportional coordinates. This is a flat UV map, NEVER a rendered plane or scene. Enhance ONLY surface detail: richer golden-yellow lacquer paint, clean deep navy stripes, crisp existing red-white-blue roundels and number 8/star markings, subtle restrained panel seams/rivets, brushed gunmetal engine cowling, clearer radial engine details, rubber wheel and dark cockpit detail. Keep broad original baked shading coherent, reduce muddy black blotches, no harsh white sparkles or new graphics. Retain original yellow/navy color identity and all existing symbols. Do not move, rotate, enlarge, remove or rearrange any texture islands. No new logos or text. No background or transparency; atlas fills entire square. Keep detail readable from a chase camera and avoid excessive tiny noise.
