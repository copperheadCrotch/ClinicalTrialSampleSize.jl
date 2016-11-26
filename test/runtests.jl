using ClinicalTrialSampleSize
using Base.Test

# Run tests

println("Running tests:")
tic()
println("Test 1:")
@time @test include("OneSampleTest.jl")
println("Test 2:")
@time @test include("TwoSampleTest.jl")
println("Test 3:")
@time @test include("CheckArgsTest.jl")
toc()
