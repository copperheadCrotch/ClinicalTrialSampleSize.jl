using Documenter
using ClinicalTrialSampleSize

makedocs()

deploydocs(
    repo = "github.com/ContaTP/ClinicalTrialSampleSize.jl.git",
    julia  = "0.5",
    deps = Deps.pip("mkdocs", "python-markdown-math"),
    make = nothing,
)
