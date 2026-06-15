module DrugInterface

# ---- drug type lattice (stratified: requirements live where they are meaningful) ----

"""
    AbstractDrug

Root of the drug type lattice. Every concrete drug type subtypes `AbstractDrug`
(directly or through a more specific abstract type).

Subtypes must implement the universal interface:

  - [`substance`](@ref)
  - [`mode_of_action`](@ref)

See also [`AbstractAntiRheumaticDrug`](@ref).
"""
abstract type AbstractDrug end

"""
    AbstractAntiRheumaticDrug <: AbstractDrug

Anti-rheumatic branch of the lattice. In addition to the [`AbstractDrug`](@ref)
interface, subtypes must implement the four classification primitives:

  - [`is_csdmard`](@ref)
  - [`is_bdmard`](@ref)
  - [`is_tsdmard`](@ref)
  - [`is_cortisone`](@ref)

The derived predicates [`is_btsdmard`](@ref) and [`is_dmard`](@ref) come for free
from these primitives.
"""
abstract type AbstractAntiRheumaticDrug <: AbstractDrug end

# ---- universal floor: required of every AbstractDrug (no default) ----

"""
    substance(d::AbstractDrug)

Return the active substance of `d` (for example `"Methotrexate"`). Required of
every [`AbstractDrug`](@ref); there is no default implementation.
"""
function substance end

"""
    mode_of_action(d::AbstractDrug)

Return the mode of action of `d` as a `Symbol` (for example `:TNFi`, `:JAKi`, or
`:none`). Required of every [`AbstractDrug`](@ref); there is no default
implementation.
"""
function mode_of_action end

# ---- RA branch primitives: required of every AbstractAntiRheumaticDrug (no default) ----

"""
    is_csdmard(d::AbstractAntiRheumaticDrug)

Return `true` if `d` is a conventional synthetic DMARD (csDMARD). Required
primitive of every [`AbstractAntiRheumaticDrug`](@ref); no default.
"""
function is_csdmard end

"""
    is_bdmard(d::AbstractAntiRheumaticDrug)

Return `true` if `d` is a biologic DMARD (bDMARD). Required primitive of every
[`AbstractAntiRheumaticDrug`](@ref); no default.
"""
function is_bdmard end

"""
    is_tsdmard(d::AbstractAntiRheumaticDrug)

Return `true` if `d` is a targeted synthetic DMARD (tsDMARD). Required primitive
of every [`AbstractAntiRheumaticDrug`](@ref); no default.
"""
function is_tsdmard end

"""
    is_cortisone(d::AbstractAntiRheumaticDrug)

Return `true` if `d` is a cortisone / glucocorticoid. Required primitive of every
[`AbstractAntiRheumaticDrug`](@ref); no default.
"""
function is_cortisone end

# ---- derived fallbacks: free on the abstract RA type ----

"""
    is_btsdmard(d::AbstractAntiRheumaticDrug)

Return `true` if `d` is a biologic *or* targeted synthetic DMARD, i.e.
[`is_bdmard`](@ref)`(d) || `[`is_tsdmard`](@ref)`(d)`. Derived automatically from
the primitives; concrete types do not implement this.
"""
is_btsdmard(d::AbstractAntiRheumaticDrug) = is_bdmard(d) || is_tsdmard(d)

"""
    is_dmard(d::AbstractAntiRheumaticDrug)

Return `true` if `d` is any DMARD (conventional synthetic, biologic, or targeted
synthetic), i.e. [`is_csdmard`](@ref)`(d) || `[`is_btsdmard`](@ref)`(d)`. Derived
automatically from the primitives.
"""
is_dmard(d::AbstractAntiRheumaticDrug) = is_csdmard(d) || is_btsdmard(d)

# ---- universal derived helper ----

"""
    is_substance(d::AbstractDrug, name)

Return `true` if the active substance of `d` equals `name`, i.e.
[`substance`](@ref)`(d) == name`. Works for any [`AbstractDrug`](@ref).
"""
is_substance(d::AbstractDrug, name) = substance(d) == name

export AbstractDrug, AbstractAntiRheumaticDrug
export substance, mode_of_action
export is_csdmard, is_bdmard, is_tsdmard, is_cortisone
export is_btsdmard, is_dmard, is_substance

end # module
