using Documenter
using ClinicalTrialSampleSize

makedocs()

deploydocs(
    repo = "https://github.com/ContaTP/ClinicalTrialSampleSize.jl",
    target = "build",
    julia  = "0.5",
    deps = Deps.pip("mkdocs", "python-markdown-math"),
    make = nothing,
)
