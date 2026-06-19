
# API Reference {#API-Reference}



## Types {#Types}
<details class='jldocstring custom-block' open>
<summary><a id='DrugInterface.AbstractDrug' href='#DrugInterface.AbstractDrug'><span class="jlbinding">DrugInterface.AbstractDrug</span></a> <Badge type="info" class="jlObjectType jlType" text="Type" /></summary>



```julia
AbstractDrug
```


Root of the drug type lattice. Every concrete drug type subtypes `AbstractDrug` (directly or through a more specific abstract type).

Subtypes must implement the universal interface:
- [`substance`](/api#DrugInterface.substance)
  
- [`mode_of_action`](/api#DrugInterface.mode_of_action)
  

See also [`AbstractAntiRheumaticDrug`](/api#DrugInterface.AbstractAntiRheumaticDrug).


<Badge type="info" class="source-link" text="source"><a href="https://github.com/simonsteiger/DrugInterface.jl/blob/ceb72fa9a11475458b5b33bf626c373215fd5408/src/DrugInterface.jl#L5-L17" target="_blank" rel="noreferrer">source</a></Badge>

</details>

<details class='jldocstring custom-block' open>
<summary><a id='DrugInterface.AbstractAntiRheumaticDrug' href='#DrugInterface.AbstractAntiRheumaticDrug'><span class="jlbinding">DrugInterface.AbstractAntiRheumaticDrug</span></a> <Badge type="info" class="jlObjectType jlType" text="Type" /></summary>



```julia
AbstractAntiRheumaticDrug <: AbstractDrug
```


Anti-rheumatic branch of the lattice. In addition to the [`AbstractDrug`](/api#DrugInterface.AbstractDrug) interface, subtypes must implement the four classification primitives:
- [`is_csdmard`](/api#DrugInterface.is_csdmard)
  
- [`is_bdmard`](/api#DrugInterface.is_bdmard)
  
- [`is_tsdmard`](/api#DrugInterface.is_tsdmard)
  
- [`is_cortisone`](/api#DrugInterface.is_cortisone)
  

The derived predicates [`is_btsdmard`](/api#DrugInterface.is_btsdmard) and [`is_dmard`](/api#DrugInterface.is_dmard) come for free from these primitives.


<Badge type="info" class="source-link" text="source"><a href="https://github.com/simonsteiger/DrugInterface.jl/blob/ceb72fa9a11475458b5b33bf626c373215fd5408/src/DrugInterface.jl#L20-L33" target="_blank" rel="noreferrer">source</a></Badge>

</details>


## Required methods {#Required-methods}
<details class='jldocstring custom-block' open>
<summary><a id='DrugInterface.substance' href='#DrugInterface.substance'><span class="jlbinding">DrugInterface.substance</span></a> <Badge type="info" class="jlObjectType jlFunction" text="Function" /></summary>



```julia
substance(d::AbstractDrug)
```


Return the active substance of `d` (for example `"Methotrexate"`). Required of every [`AbstractDrug`](/api#DrugInterface.AbstractDrug); there is no default implementation.


<Badge type="info" class="source-link" text="source"><a href="https://github.com/simonsteiger/DrugInterface.jl/blob/ceb72fa9a11475458b5b33bf626c373215fd5408/src/DrugInterface.jl#L38-L43" target="_blank" rel="noreferrer">source</a></Badge>

</details>

<details class='jldocstring custom-block' open>
<summary><a id='DrugInterface.mode_of_action' href='#DrugInterface.mode_of_action'><span class="jlbinding">DrugInterface.mode_of_action</span></a> <Badge type="info" class="jlObjectType jlFunction" text="Function" /></summary>



```julia
mode_of_action(d::AbstractDrug)
```


Return the mode of action of `d` as a `Symbol` (for example `:TNFi`, `:JAKi`, or `:none`). Required of every [`AbstractDrug`](/api#DrugInterface.AbstractDrug); there is no default implementation.


<Badge type="info" class="source-link" text="source"><a href="https://github.com/simonsteiger/DrugInterface.jl/blob/ceb72fa9a11475458b5b33bf626c373215fd5408/src/DrugInterface.jl#L46-L52" target="_blank" rel="noreferrer">source</a></Badge>

</details>

<details class='jldocstring custom-block' open>
<summary><a id='DrugInterface.is_csdmard' href='#DrugInterface.is_csdmard'><span class="jlbinding">DrugInterface.is_csdmard</span></a> <Badge type="info" class="jlObjectType jlFunction" text="Function" /></summary>



```julia
is_csdmard(d::AbstractAntiRheumaticDrug)
```


Return `true` if `d` is a conventional synthetic DMARD (csDMARD). Required primitive of every [`AbstractAntiRheumaticDrug`](/api#DrugInterface.AbstractAntiRheumaticDrug); no default.


<Badge type="info" class="source-link" text="source"><a href="https://github.com/simonsteiger/DrugInterface.jl/blob/ceb72fa9a11475458b5b33bf626c373215fd5408/src/DrugInterface.jl#L57-L62" target="_blank" rel="noreferrer">source</a></Badge>

</details>

<details class='jldocstring custom-block' open>
<summary><a id='DrugInterface.is_bdmard' href='#DrugInterface.is_bdmard'><span class="jlbinding">DrugInterface.is_bdmard</span></a> <Badge type="info" class="jlObjectType jlFunction" text="Function" /></summary>



```julia
is_bdmard(d::AbstractAntiRheumaticDrug)
```


Return `true` if `d` is a biologic DMARD (bDMARD). Required primitive of every [`AbstractAntiRheumaticDrug`](/api#DrugInterface.AbstractAntiRheumaticDrug); no default.


<Badge type="info" class="source-link" text="source"><a href="https://github.com/simonsteiger/DrugInterface.jl/blob/ceb72fa9a11475458b5b33bf626c373215fd5408/src/DrugInterface.jl#L65-L70" target="_blank" rel="noreferrer">source</a></Badge>

</details>

<details class='jldocstring custom-block' open>
<summary><a id='DrugInterface.is_tsdmard' href='#DrugInterface.is_tsdmard'><span class="jlbinding">DrugInterface.is_tsdmard</span></a> <Badge type="info" class="jlObjectType jlFunction" text="Function" /></summary>



```julia
is_tsdmard(d::AbstractAntiRheumaticDrug)
```


Return `true` if `d` is a targeted synthetic DMARD (tsDMARD). Required primitive of every [`AbstractAntiRheumaticDrug`](/api#DrugInterface.AbstractAntiRheumaticDrug); no default.


<Badge type="info" class="source-link" text="source"><a href="https://github.com/simonsteiger/DrugInterface.jl/blob/ceb72fa9a11475458b5b33bf626c373215fd5408/src/DrugInterface.jl#L73-L78" target="_blank" rel="noreferrer">source</a></Badge>

</details>

<details class='jldocstring custom-block' open>
<summary><a id='DrugInterface.is_cortisone' href='#DrugInterface.is_cortisone'><span class="jlbinding">DrugInterface.is_cortisone</span></a> <Badge type="info" class="jlObjectType jlFunction" text="Function" /></summary>



```julia
is_cortisone(d::AbstractAntiRheumaticDrug)
```


Return `true` if `d` is a cortisone / glucocorticoid. Required primitive of every [`AbstractAntiRheumaticDrug`](/api#DrugInterface.AbstractAntiRheumaticDrug); no default.


<Badge type="info" class="source-link" text="source"><a href="https://github.com/simonsteiger/DrugInterface.jl/blob/ceb72fa9a11475458b5b33bf626c373215fd5408/src/DrugInterface.jl#L81-L86" target="_blank" rel="noreferrer">source</a></Badge>

</details>


## Derived methods {#Derived-methods}
<details class='jldocstring custom-block' open>
<summary><a id='DrugInterface.is_btsdmard' href='#DrugInterface.is_btsdmard'><span class="jlbinding">DrugInterface.is_btsdmard</span></a> <Badge type="info" class="jlObjectType jlFunction" text="Function" /></summary>



```julia
is_btsdmard(d::AbstractAntiRheumaticDrug)
```


Return `true` if `d` is a biologic _or_ targeted synthetic DMARD, i.e. [`is_bdmard`](/api#DrugInterface.is_bdmard)`(d) ||`[`is_tsdmard`](/api#DrugInterface.is_tsdmard)`(d)`. Derived automatically from the primitives; concrete types do not implement this.


<Badge type="info" class="source-link" text="source"><a href="https://github.com/simonsteiger/DrugInterface.jl/blob/ceb72fa9a11475458b5b33bf626c373215fd5408/src/DrugInterface.jl#L91-L97" target="_blank" rel="noreferrer">source</a></Badge>

</details>

<details class='jldocstring custom-block' open>
<summary><a id='DrugInterface.is_dmard' href='#DrugInterface.is_dmard'><span class="jlbinding">DrugInterface.is_dmard</span></a> <Badge type="info" class="jlObjectType jlFunction" text="Function" /></summary>



```julia
is_dmard(d::AbstractAntiRheumaticDrug)
```


Return `true` if `d` is any DMARD (conventional synthetic, biologic, or targeted synthetic), i.e. [`is_csdmard`](/api#DrugInterface.is_csdmard)`(d) ||`[`is_btsdmard`](/api#DrugInterface.is_btsdmard)`(d)`. Derived automatically from the primitives.


<Badge type="info" class="source-link" text="source"><a href="https://github.com/simonsteiger/DrugInterface.jl/blob/ceb72fa9a11475458b5b33bf626c373215fd5408/src/DrugInterface.jl#L100-L106" target="_blank" rel="noreferrer">source</a></Badge>

</details>

<details class='jldocstring custom-block' open>
<summary><a id='DrugInterface.is_substance' href='#DrugInterface.is_substance'><span class="jlbinding">DrugInterface.is_substance</span></a> <Badge type="info" class="jlObjectType jlFunction" text="Function" /></summary>



```julia
is_substance(d::AbstractDrug, name)
```


Return `true` if the active substance of `d` equals `name`, i.e. [`substance`](/api#DrugInterface.substance)`(d) == name`. Works for any [`AbstractDrug`](/api#DrugInterface.AbstractDrug).


<Badge type="info" class="source-link" text="source"><a href="https://github.com/simonsteiger/DrugInterface.jl/blob/ceb72fa9a11475458b5b33bf626c373215fd5408/src/DrugInterface.jl#L111-L116" target="_blank" rel="noreferrer">source</a></Badge>

</details>

