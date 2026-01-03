# Workflow

## App Name in Workflow List

Below is a list of link, they are configurations for sketchybar shared by user on github. Some of those set of config have features that I want to reproduce.

For this first task, you will start one sub-agent per link.

Sub-agents have to use `agt-persona-tech-lead`

The sub agent read the given dotfiles and write a file `[feature].dotfiles.md` that explain how to reproduce the settings I request, with the exact same value. One file per feature requested.

https://github.com/neutonfoo/dotfiles
-> From this link
- What is the font of the bar (font, size, style)

https://github.com/CriticalElement/dotfiles
-> From this link
- The bar only is visible when there is an item to show, copy this settings
- Copy all color code used in the dotfiles and how to reproduce

## Research Feature

Start a sub-agent in paralel with previous header's agents.

Sub-agents have to use `agt-persona-tech-lead`

Search on sketchybar documentation if possible to add, in the numeric workspace list on the left side, after each workspace number, the name of the app inside, example:

```example
[1] Brave Obsidian [2] [3] Code iTerm2
```

If possible write `workspace-app.dotfiles.md`

## Implement

Every time a dotfiles.md is generated and the agent finish to work on it, immediatly start a sub-agent `agt-persona-tech-lead` that will implement the feature describes in `[feature].dotfiles.md` that just been written. You dont need to wait all feature files to be ready to start this step, you do it as soon as the dotfiles.md is available.

Use Opus 4.5 sub-agent for this task to ensure best result

You also start one sub agent to remove the apple icon in sketchybar. No need documentation for this one.

