# Getting Started

`DrugInterface` ships only abstract types and trait functions. To use it, define
a concrete type and implement the required methods.

## Install and load

```julia
using Pkg
Pkg.develop(path="DrugInterface")  # local, unregistered package
using DrugInterface
```

## Implement the interface

Subtype [`AbstractAntiRheumaticDrug`](@ref) and implement the universal methods
([`substance`](@ref), [`mode_of_action`](@ref)) and the four classification
primitives ([`is_csdmard`](@ref), [`is_bdmard`](@ref), [`is_tsdmard`](@ref),
[`is_cortisone`](@ref)):

```@example drugiface
using DrugInterface

struct Drug <: AbstractAntiRheumaticDrug
    name::String
    moa::Symbol
    csdmard::Bool
    bdmard::Bool
    tsdmard::Bool
    cortisone::Bool
end

DrugInterface.substance(d::Drug)      = d.name
DrugInterface.mode_of_action(d::Drug) = d.moa
DrugInterface.is_csdmard(d::Drug)     = d.csdmard
DrugInterface.is_bdmard(d::Drug)      = d.bdmard
DrugInterface.is_tsdmard(d::Drug)     = d.tsdmard
DrugInterface.is_cortisone(d::Drug)   = d.cortisone

mtx = Drug("Methotrexate", :none, true, false, false, false)
nothing # hide
```

## Use the primitives

```@example drugiface
substance(mtx), mode_of_action(mtx), is_csdmard(mtx)
```

## Get the derived predicates for free

You implemented four primitives; [`is_btsdmard`](@ref) and [`is_dmard`](@ref)
already work:

```@example drugiface
ada = Drug("Adalimumab", :TNFi, false, true, false, false)
is_dmard(mtx), is_btsdmard(mtx), is_btsdmard(ada)
```
