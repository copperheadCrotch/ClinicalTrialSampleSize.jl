using Documenter
using ClinicalTrialSampleSize

makedocs(
    modules = [ClinicalTrialSampleSize],
    sitename = "ClinicalTrialSampleSize.jl",
    pages = Any[
        "Home" => "index.md",
        "Usage" => "man/usage.md",
        "Commands" => "man/command.md"
    ],
    doctest = false
)

deploydocs(
    repo = "github.com/ContaTP/ClinicalTrialSampleSize.jl.git",
    target = "build",
    julia  = "0.5",
    deps = Deps.pip("mkdocs", "python-markdown-math"),
    make = nothing,
)
