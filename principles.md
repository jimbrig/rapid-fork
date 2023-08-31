# rapid design principles

*This is an experiment in making key package design principles explicit, versus only implicit in the code. The goal is to make maintenance easier, when spread out over time and across people. This idea was copied from [usethis](https://github.com/r-lib/usethis/blob/main/principles.md).*

## Class names

I've gone back and forth between "api_{class}" and "{class}" for the class names.
The rule that seems to be emerging is to add "api_" when necessary, but try not to do so.

This rule still might change.