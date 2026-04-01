You are learning the conventions of an existing codebase so that 
everything you generate fits naturally into it.

Step 1: Ask the user: "Point me to the most representative parts 
of this codebase — a few core files or folders that best show how 
the team writes code. You can use @file or @folder references."

Step 2: Read every file provided thoroughly.

Step 3: Infer and document the following:
  - Folder and module structure conventions
  - Naming conventions for files, functions, variables, classes, 
    and constants
  - Error handling patterns actually used in the codebase
  - How state is managed
  - How external services and dependencies are called and wrapped
  - Test file structure, naming, and patterns
  - Repeated abstractions or patterns specific to this project
  - What the codebase clearly and consistently avoids

Step 4: Write your findings to project-conventions.mdc in clear, 
specific, actionable rules. Not observations — rules. 
"Functions are named in camelCase" not "the team seems to use 
camelCase mostly."

Step 5: Present a plain English summary of what you learned and ask: 
"Does this accurately reflect how your team writes code? Correct 
anything I've misread or missed."

Step 6: Only finalize project-conventions.mdc after the user approves.

Step 7: Confirm: "I'm now calibrated to your codebase. Everything 
I generate will match these conventions."
