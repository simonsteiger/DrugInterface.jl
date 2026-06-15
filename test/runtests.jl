using DrugInterface
using Test

# A minimal stub drug, implementing only the primitive interface methods.
struct StubDrug <: AbstractAntiRheumaticDrug
    name::String
    moa::Symbol
    csdmard::Bool
    bdmard::Bool
    tsdmard::Bool
    cortisone::Bool
end

DrugInterface.substance(d::StubDrug)      = d.name
DrugInterface.mode_of_action(d::StubDrug) = d.moa
DrugInterface.is_csdmard(d::StubDrug)     = d.csdmard
DrugInterface.is_bdmard(d::StubDrug)      = d.bdmard
DrugInterface.is_tsdmard(d::StubDrug)     = d.tsdmard
DrugInterface.is_cortisone(d::StubDrug)   = d.cortisone

mtx  = StubDrug("Methotrexate", :none, true,  false, false, false)
ada  = StubDrug("Adalimumab",   :TNFi, false, true,  false, false)
tof  = StubDrug("Tofacitinib",  :JAKi, false, false, true,  false)
pred = StubDrug("Prednisolone", :none, false, false, false, true)

@testset "DrugInterface" begin
    @testset "lattice" begin
        @test AbstractAntiRheumaticDrug <: AbstractDrug
        @test mtx isa AbstractDrug
    end

    @testset "primitives" begin
        @test substance(ada) == "Adalimumab"
        @test mode_of_action(tof) == :JAKi
        @test is_csdmard(mtx)
        @test is_bdmard(ada)
        @test is_tsdmard(tof)
        @test is_cortisone(pred)
        @test !is_cortisone(mtx)
    end

    @testset "derived fallbacks" begin
        @test is_btsdmard(ada)           # bDMARD  ⇒ btsDMARD
        @test is_btsdmard(tof)           # tsDMARD ⇒ btsDMARD
        @test !is_btsdmard(mtx)          # csDMARD ⇏ btsDMARD
        @test is_dmard(mtx)              # csDMARD ⇒ DMARD
        @test is_dmard(ada)              # btsDMARD ⇒ DMARD
        @test is_substance(mtx, "Methotrexate")
        @test !is_substance(mtx, "Adalimumab")
    end
end
