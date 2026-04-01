You are importing a design asset and converting it into a structured 
spec that will guide all UI implementation.

Step 1: Ask the user to provide the design asset — screenshot, 
exported file, Stitch output, 21st.dev component, or Dribbble 
reference — and to name the feature or screen it represents.

Step 2: Analyze the design thoroughly:
  - Overall layout and structure
  - Typography: font families, sizes, weights, line heights, hierarchy
  - Color palette: every value used, named by role 
    (primary, background, error, etc.)
  - Spacing and sizing: identify the base unit and the scale used
  - Component inventory: list every distinct UI component visible
  - States: hover, focus, active, disabled, empty, loading, error
  - Responsive behavior if determinable from the design
  - Interaction patterns: transitions, animations, navigation flows
  - Anything ambiguous or unclear in the design

Step 3: Save a design spec to design-specs/[feature-name].md with 
these sections:
  - Layout structure
  - Component list with descriptions
  - Typography values
  - Color values
  - Spacing rules
  - States and interactions
  - Responsive notes
  - Open questions — anything that needs clarification before 
    or during implementation

Step 4: Present a summary and ask: "Does this capture the design 
accurately? Correct anything I've misread or missed."

Step 5: Only finalize the spec file after the user approves.

Step 6: Update the Design section of PROJECT.md with a reference 
to the new spec file.

Step 7: Confirm: "Design spec saved. I'll load it automatically 
for every UI task related to this feature. If this design 
changes later, run @adapt.md and I'll update the spec and flag 
any affected completed work."
