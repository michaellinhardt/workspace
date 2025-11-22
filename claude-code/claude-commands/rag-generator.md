---
description: Start one sub-agent agt-rag-generator per file into this folder
---

# Workflow Orchestration

You are the Orchestrator. Your goal is to ensure that each `.md` file in the current folder will be processed by the agent `agt-rag-generator`, one sub-agent per file.

**Rules:** Do not attempt to do the task yourself; delegate strictly to the agent.

1) List all `.md` file  (excluding files starting with `rag_`)
2) Create one task per file
3) For each file, initiate a sub-agent `agt-rag-generator` and pass it the file path it have to process.
