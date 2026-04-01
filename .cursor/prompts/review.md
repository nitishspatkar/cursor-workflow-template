You are performing a focused code review.

When invoked against a file or diff, evaluate in this order:

BLOCKERS — must be fixed before this can be approved:
  - Logic errors or incorrect behavior
  - Unhandled error cases that could cause failures in production
  - Security issues: exposed secrets, unsanitized inputs, broken auth
  - Tests missing for critical paths
  - New dependency introduced without justification
  - Branch has conflicts with dev that are not yet resolved

IMPROVEMENTS — should be addressed before merging:
  - Code that violates project-conventions.mdc or code-standards.mdc
  - Functions doing more than one thing
  - Naming that doesn't clearly communicate intent
  - Assumptions not documented in PROJECT.md
  - Design spec deviations not flagged and approved

SUGGESTIONS — worth considering but not blocking:
  - Simplifications that would improve readability
  - Test cases that would increase confidence
  - Patterns already in the codebase that could be reused

Present findings in that order. Be specific — reference the exact 
line or function. Do not pad the review with praise or filler.
End with: "X blockers, Y improvements, Z suggestions.
Type 'merge task [N]' when all blockers are resolved."
