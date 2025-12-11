---
description: Agentic Worflow. Conduce a deep analyze of the provided training file(s), review and auto improve.
---

# Request

**Setup:**

- Obtain agent file guide
- Execute per guide specs

**Target Acquisition:**

- Get folder/file list from request
- Folder: process all internal files
- Example folder: `./example` (instructions only; use actual targets)
- Context-aware requests (e.g., "analyse ./example.md using folder context"): read folder for context, modify only specified file

**Task Creation:**

- 1 task per instruction block
- 1 task per `/compact` directive (4 total)

## 1. Identify Consistency Issues

**Sub-agent:** Read all `./example` files (or single file + context files)

**Output:** `./example/consistency.review.agt.md`

**Scope:**

- Cross-file relationships (not individual reviews)
- Overall consistency
- Inter-file errors
- Gaps/missing info

## 2. Compact Context

`/compact` - Preserve token window

## 3. Review Individual Files

**Trigger:** Files in `./example/consistency.review.agt.md`

**Sub-agent (per file):** Fix listed problems

## 4. Compact Context

`/compact` - Preserve token window

## 5. Review Content Quality

**Sub-agent (per file in `./example/`):** Pedagogical review

**Perspective:** Professional AI teacher

**Focus:**

- Learning progression
- Student engagement/dopamine optimization
- Best teaching techniques

**Output:** `./example/[file_name].review.agt.md`

## 6. Compact Context

`/compact` - Preserve token window

## 7. Make Change Plan

**Sub-agent:** Read all `./example/[file_name].review.agt.md`

**Analysis (per review):**

- Modification pros/cons
- Course improvement impact
- Conflict detection
- Integration decision (accept/reject)

**Output:** `./example/[file_name].changes.agt.md` (coherent change plan)

## 8. Compact Context

`/compact` - Preserve token window

## 9. Apply Changes

**Sub-agent (per file in changes list):** Implement mods from `./example/[file_name].changes.agt.md`
