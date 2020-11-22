# Building an R Package

## package structure/features
- Code goes in `R/`
- Tests go in `tests/`
- Data goes in `data/`
- One function definition per `.R` file (under `R/`) at first. With experience, group functions semantically in files
- `DESCRIPTION`, `NAMESPACE`, `.Rbuildignore`, `.Rprojuser` (created by `devtools.create_package`) described[here](https://r-pkgs.org/whole-game.html#create_package). 

## Devtools

- `library(devtools)` it first
- `create_package("filepath")` will initialize the package structure. Use once.
- `use_git()` will initialize a git repo. Use once.
- `use_r("my_func")` creates a new `.R` file for your function. Use once.
- `use_test()` creates a new test file for the function. Use when you create new function.
- `load_all()` makes our functions available for testing in the console - in doing so, it simulates building, installing, and attaching the package (and its contents)
- `check()` runs `R CMD check` from the console, and checks that our package works. Use regularly
- `document()` generates Roxygen documentation from docstrings. Use regularly.
- `install()` installs the package (presumably at $PWD) so R can attach it with `library`. Use as needed. 
- `use_testthat()` sets  up `testthat()`. You'll still need to `library(testthat)`. Use once.
- `test()` runs your tests. Use regularly.
- `use_package("some_package")` to import functions from other-package namespaces. Use whenever importing a fn.
- `use_readme_rmd()` wires up a `README.Rmd` (which can execute live code) to our existing `README.md`. Use once.
- `build_readme()` builds the `README.md`. Use regularly.

## Documentation
- place cursor in fn def and use Code -> Insert Roxygen Skeleton or Ctrl-Alt-Shift-R to generate a doc comment skeleton
- Roxygen comments begin each line with `#'`
- Use `document()` to simulate built docs without actually building


