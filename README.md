# Island Stunt Pilot — current source snapshot

Saved from the current browser game on 2026-10-21. This is a self-contained project snapshot, separate from the large working/recovery folder. It contains the current code and selected artwork, the recovered game source and base SWF, the tools needed to rebuild, and one copy of the current compiled game. Old experiments, alternate Ruffle runtimes, screenshots, logs, obsolete builds and historical asset variants are omitted.

## Start here

- **Play.cmd** starts the local browser game using the included current SWF.
- **Build.cmd** rebuilds the SWF and creates the upload folder and ZIP.
- **Package-Website.cmd** creates the upload folder and ZIP without recompiling the SWF. Use after changing JavaScript, HTML or GPU textures.

Install Node.js and a JDK (Java 17 or newer, providing `java` on PATH) before rebuilding. Playing/packaging locally requires Node.js and Windows PowerShell. FFDec and Ruffle are included; no npm packages or API key are needed. The generated website requires only static HTTP/HTTPS hosting, JavaScript and WebGL; it does not require Node or Java on the website server.

## Source layout

| Folder | Contents |
|---|---|
| `patches/sp2-gpu.as` | Current game logic, responsive UI, camera fixes and themed menus |
| `patches/core_plane.as` | Plane controls and boost smoke patch |
| `player/` | Current browser page, preloader, viewport handling, GPU renderer, meshes, textures and Ruffle |
| `assets/` | Selected UI artwork and texture masters, generation prompts and original texture rollback assets |
| `recovery/game/` | Decompiled original ActionScript, images, sounds and other exported assets |
| `recovery/game.swf` | Required base SWF used by FFDec to rebuild the patched game |
| `recovery/pcode/` | Required original engine bytecode export for the texture compatibility patch |
| `tools/` | Compiler patch helpers, mesh export, local server, packaging and texture selection tools |
| `ffdec/` | FFDec JAR, supporting libraries, Flash API libraries and license |
| `build/stunt-pilot-gpu.swf` | Exact current compiled SWF at snapshot time |

The files under `recovery/game/scripts/` are the original recovered source. Current replacements are under `patches/`; edit those when changing the active game. The base SWF must be retained because this project rebuilds by replacing classes/assets inside it, rather than compiling a new Flash project from scratch.

## Current behavior

Includes the Island logo, themed centered pause/result buttons, compact teal Invert Y switch, orange Resume and Continue, enhanced plane/checkpoint textures, 10% smaller lives icons, and lightweight preloader with rotating tips. FPS display and I/O map-test shortcuts are removed.

The preloader CSS is retained as an editable source file and also inlined into the HTML pages. If editing it, synchronize the inline preloader styles in `player/recovered.html` and `player/gpu.html` before packaging.

## Website output

Run `Package-Website.cmd` to generate:

```
build/website-upload/
  index.html
  game-files/
build/stunt-pilot-website.zip
```

Upload `index.html` and the entire `game-files` folder together. The generated upload folder/ZIP are omitted from this source archive to avoid storing a second copy of all runtime assets. Build intermediates are also regenerated as needed.

## Restore original textures

Use `Restore-Original-Plane.cmd` / `Use-Enhanced-Plane.cmd` and `Restore-Original-Checkpoints.cmd` / `Use-Enhanced-Checkpoints.cmd`, then refresh. These update the GPU manifest and rebuild the website package. Original texture files are preserved. They do not revert UI or gameplay fixes.

Original game by FreeOnlineGames. Ruffle and FFDec retain their included licenses. Keep their license files with redistributed tools/runtime. This snapshot does not include Java or Node.js installers.

Mouse boost update (2026-10-22): in Mouse Control mode, holding the mouse button activates boost and its existing white smoke trails; releasing restores normal thrust. Shift is no longer required in mouse mode. Keyboard-mode click behavior and Space boost are unchanged. Loader tips updated. SWF rebuilt successfully; live browser verification was unavailable in this session.


Input refinement (2026-10-22): mouse clicks affect plane smoke/boost only in Mouse Control mode. In Keyboard Control mode use Space for boost/smoke and Tab for manual smoke. Escape opens pause instead of returning to the main menu. Resume continues the current level.


Escape also resumes when pressed on the pause screen (2026-10-22).


Crash feedback (2026-10-22): Retry/Game Over panel appears 1.5 seconds after a crash, allowing the crash scene to remain visible first. Successful-level Continue timing is unchanged.


Completion feedback (2026-10-22): Level Complete and Adventure Complete now also appear after a 1.5-second delay, matching the crash result delay.


Result shortcut (2026-10-22): once a result panel appears, press Space or click its button. Space retries a failed level, continues a completed level, or performs the displayed final/Game Over action. Release and press again if Space was held for boost; automatic key-repeat cannot skip results.


Level Complete now appears after 0.5 seconds; crash/Game Over and final completion remain at 1.5 seconds (2026-10-22).


Current result layout (2026-10-22): all result panels appear after 1.5 seconds. Retry/Game Over and completion panels are 20% smaller and remain centered; Pause is unchanged.

