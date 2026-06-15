# The Interface

## Type lattice

The package stratifies requirements: each abstract type declares only the
methods that are meaningful at its level.

```
AbstractDrug                    # requires: substance, mode_of_action
└── AbstractAntiRheumaticDrug   # additionally requires: is_csdmard, is_bdmard,
                                #   is_tsdmard, is_cortisone
```

## Required methods

These have no default — a concrete type must implement them or calls will error.

| Method | Declared on | Returns |
| --- | --- | --- |
| [`substance`](@ref) | `AbstractDrug` | active substance name |
| [`mode_of_action`](@ref) | `AbstractDrug` | mode of action `Symbol` |
| [`is_csdmard`](@ref) | `AbstractAntiRheumaticDrug` | `Bool` |
| [`is_bdmard`](@ref) | `AbstractAntiRheumaticDrug` | `Bool` |
| [`is_tsdmard`](@ref) | `AbstractAntiRheumaticDrug` | `Bool` |
| [`is_cortisone`](@ref) | `AbstractAntiRheumaticDrug` | `Bool` |

## Derived methods

These are defined on the abstract type in terms of the primitives — concrete
types get them for free and should not override them.

| Method | Definition |
| --- | --- |
| [`is_btsdmard`](@ref) | `is_bdmard(d) \|\| is_tsdmard(d)` |
| [`is_dmard`](@ref) | `is_csdmard(d) \|\| is_btsdmard(d)` |
| [`is_substance`](@ref) | `substance(d) == name` |

## Worked example

```@example
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

tof = Drug("Tofacitinib", :JAKi, false, false, true, false)

(is_tsdmard = is_tsdmard(tof), is_btsdmard = is_btsdmard(tof), is_dmard = is_dmard(tof))
```
