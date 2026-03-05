# Testing Guidelines

- New features should have tests; bug fixes should have a regression test
- Test behavior, not implementation — tests should survive refactoring
- Prefer real assertions over snapshot tests where the intent can be expressed directly
- Avoid mocking internals; mock at system boundaries (network, filesystem, time)
- A test that always passes is worse than no test
