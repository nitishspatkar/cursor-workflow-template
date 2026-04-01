# Cursor Workflow Template

A lightweight but disciplined workflow system for building production-quality software with Cursor agents.

It is designed to help you:
- move fast as a solo builder,
- stay organized as a small team,
- preserve context across sessions,
- keep code quality, testing, and design fidelity consistent.

## What this template includes

- `.cursor/rules/`  
  Always-on operating rules for session bootstrap, coding standards, testing discipline, teamwork hygiene, design fidelity, and git workflow.
- `.cursor/prompts/`  
  Phase and utility agents for requirements, architecture, planning, implementation, merge, adaptation, codebase learning, design import, and review.
- `PROJECT.md`  
  Single source of truth for project memory across phases, tasks, branches, and changes.
- `setup-workflow.sh`  
  Installer script to copy the workflow system into any target project.
- `workflow-template/`  
  Ready-to-copy packaged version used by the installer script.

## Quick start (new project)

From this repo:
```bash
./setup-workflow.sh "/path/to/your-new-project"
```

Then open the target project in Cursor and type:
```text
next step
```

## Quick start (existing project)

1. Install the workflow into the project:
```bash
./setup-workflow.sh "/path/to/existing-project"
```

2. Open the existing project in Cursor.

3. Run:
```text
@learn-codebase.md
```
This calibrates `project-conventions.mdc` to the project's real code style before implementation work begins.

## UI workflow

Before any UI implementation tasks, run:
```text
@import-design.md
```
This creates structured specs under `design-specs/` and enables design-fidelity checks.

## Day-to-day usage

- Start/resume work:
```text
next step
```
- Integrate any new idea/scope change:
```text
(describe the change in plain English)
```
The system routes to `@adapt.md` automatically.
- Merge completed task:
```text
merge task [N]
```

## Updating this template

Use this repository as your canonical source.

When you improve rules/prompts:
1. Update this template repo.
2. Re-run `setup-workflow.sh` in target projects.
3. If prompted, overwrite only what you intend to refresh.

## Notes

- `PROJECT.md` is the memory backbone of the system. Keep it current.
- `project-conventions.mdc` is intentionally empty until learned from a real codebase.
- For team usage, commit these workflow files to each project so everyone shares the same process.
