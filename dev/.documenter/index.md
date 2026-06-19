---
layout: home

hero:
  name: "DrugInterface.jl"
  tagline: "A unified interface for working with ATC codes"
  image:
    src: logo.svg
    alt: DrugInterface
  actions:
    - theme: brand
      text: Getting Started
      link: /getting_started
    - theme: alt
      text: The Interface
      link: /interface
    - theme: alt
      text: API Reference
      link: /api

features:
  - title: Stratified requirements
    details: Each abstract type declares only the methods that are meaningful at its level — universal methods on AbstractDrug, classification primitives on the anti-rheumatic branch.
  - title: Derived predicates for free
    details: Implement four primitives and is_btsdmard / is_dmard come for free from the abstract fallbacks.
  - title: Implementation-agnostic
    details: Any struct can satisfy the interface by defining the primitive methods — no concrete types are imposed.
---


## Installation {#Installation}

This package is not yet registered. Add it via URL:

```julia
using Pkg
Pkg.add(url = "https://github.com/simonsteiger/DrugInterface.jl")
```


## Overview {#Overview}

`DrugInterface` defines the abstract types and trait functions used across the `02_outcomes` project to classify anti-rheumatic drugs. It contains no concrete drug types: downstream packages implement the interface for their own structs.

Start with [Getting Started](/getting_started) to implement the interface, read [The Interface](/interface) for the full type lattice, or jump to the [API Reference](/api).
