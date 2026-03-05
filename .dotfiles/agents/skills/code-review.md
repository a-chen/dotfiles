# Code Review Guidelines

- Prefer clarity over cleverness; flag anything that requires a comment to be understandable
- Identify dead code, unused variables, and unnecessary abstractions
- Call out premature abstractions — three similar lines of code is better than a wrong abstraction
- Flag missing error handling at system boundaries (user input, external APIs, file I/O)
- Note performance issues only when they are clearly problematic, not hypothetical
