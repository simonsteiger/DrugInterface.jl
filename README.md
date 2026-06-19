# DrugInterface.jl

[![Build Status](https://github.com/simonsteiger/DrugInterface.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/simonsteiger/DrugInterface.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://simonsteiger.github.io/DrugInterface.jl/dev/) <a href="https://simonsteiger.github.io/StyledTables.jl/dev"><img src="/docs/src/assets/logo.svg" align="right" alt="DrugInterface logo" style="height: 140px;"></a>

DrugInterface implements an extensible, abstract type that can be extended for working with medicines in different contexts (see [AntiRheumaticDrugs.jl](https://github.com/simonsteiger/AntiRheumaticDrugs.jl) for an example).

> [!WARNING]
> This package is very immature and almost entirely written by Claude at this point.
> 
> As time passes, I will continue to review and clean up.

## Installation

This package is not currently registered in the general registry, but it can be installed via url:

```julia
import Pkg
Pkg.add(url = "https://github.com/simonsteiger/DrugInterface.jl")
```
