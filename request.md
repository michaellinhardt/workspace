# Request

## Documentation

3 Sub-Agent

- Go search documentation for [ AeroSpace, SketchyBar, JankyBorder ]
- Write Report about main features, what it can do, how, official doc links etc.. ( related to AeroSpace integrations ) in `[app].doc.md`

## Prepare ui.settings.md

Sub-Agent to read all `doc` file and take the screenshot `aerospace.png` showing an interfaces made by an user online.

Sub agent write `ui.settings.md`,
- A list of all feature/settings identifiable on this screenshot
- For each feature/settings, how to reproduce it
- A list of all color code and appearance elements identifiable and how to implement it

## AI Review Settings

task a sub-agent to read `ui.settings.md` and for each settings mentioned, verify online documentaiton to be sure it is properly documented and correct, if not fix it

## Apply Settings

Task a sub agent to apply the settings requested, provide it necessary files