
# The Interface {#The-Interface}

## Type lattice {#Type-lattice}

The package stratifies requirements: each abstract type declares only the methods that are meaningful at its level.

```
AbstractDrug                    # requires: substance, mode_of_action
└── AbstractAntiRheumaticDrug   # additionally requires: is_csdmard, is_bdmard,
                                #   is_tsdmard, is_cortisone
```


## Required methods {#Required-methods}

These have no default — a concrete type must implement them or calls will error.

|                                                Method |                 Declared on |                 Returns |
| -----------------------------------------------------:| ---------------------------:| -----------------------:|
|           [`substance`](/api#DrugInterface.substance) |              `AbstractDrug` |   active substance name |
| [`mode_of_action`](/api#DrugInterface.mode_of_action) |              `AbstractDrug` | mode of action `Symbol` |
|         [`is_csdmard`](/api#DrugInterface.is_csdmard) | `AbstractAntiRheumaticDrug` |                  `Bool` |
|           [`is_bdmard`](/api#DrugInterface.is_bdmard) | `AbstractAntiRheumaticDrug` |                  `Bool` |
|         [`is_tsdmard`](/api#DrugInterface.is_tsdmard) | `AbstractAntiRheumaticDrug` |                  `Bool` |
|     [`is_cortisone`](/api#DrugInterface.is_cortisone) | `AbstractAntiRheumaticDrug` |                  `Bool` |


## Derived methods {#Derived-methods}

These are defined on the abstract type in terms of the primitives — concrete types get them for free and should not override them.

|                                            Method |                          Definition |
| -------------------------------------------------:| -----------------------------------:|
|   [`is_btsdmard`](/api#DrugInterface.is_btsdmard) |   `is_bdmard(d) \|\| is_tsdmard(d)` |
|         [`is_dmard`](/api#DrugInterface.is_dmard) | `is_csdmard(d) \|\| is_btsdmard(d)` |
| [`is_substance`](/api#DrugInterface.is_substance) |              `substance(d) == name` |


## Worked example {#Worked-example}

```julia
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


```ansi
(is_tsdmard = true, is_btsdmard = true, is_dmard = true)
```

