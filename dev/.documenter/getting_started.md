
# Getting Started {#Getting-Started}

`DrugInterface` ships only abstract types and trait functions. To use it, define a concrete type and implement the required methods.

## Install and load {#Install-and-load}

```julia
using Pkg
Pkg.develop(path="DrugInterface")  # local, unregistered package
using DrugInterface
```


## Implement the interface {#Implement-the-interface}

Subtype [`AbstractAntiRheumaticDrug`](/api#DrugInterface.AbstractAntiRheumaticDrug) and implement the universal methods ([`substance`](/api#DrugInterface.substance), [`mode_of_action`](/api#DrugInterface.mode_of_action)) and the four classification primitives ([`is_csdmard`](/api#DrugInterface.is_csdmard), [`is_bdmard`](/api#DrugInterface.is_bdmard), [`is_tsdmard`](/api#DrugInterface.is_tsdmard), [`is_cortisone`](/api#DrugInterface.is_cortisone)):

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

mtx = Drug("Methotrexate", :none, true, false, false, false)
```


## Use the primitives {#Use-the-primitives}

```julia
substance(mtx), mode_of_action(mtx), is_csdmard(mtx)
```


```ansi
("Methotrexate", :none, true)
```


## Get the derived predicates for free {#Get-the-derived-predicates-for-free}

You implemented four primitives; [`is_btsdmard`](/api#DrugInterface.is_btsdmard) and [`is_dmard`](/api#DrugInterface.is_dmard) already work:

```julia
ada = Drug("Adalimumab", :TNFi, false, true, false, false)
is_dmard(mtx), is_btsdmard(mtx), is_btsdmard(ada)
```


```ansi
(true, false, true)
```

