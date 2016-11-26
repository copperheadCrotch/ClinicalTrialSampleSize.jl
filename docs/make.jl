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
    deps   = Deps.pip("mkdocs", "python-markdown-math"),
    repo = "https://github.com/ContaTP/ClinicalTrialSampleSize.jl",
    target = "build",
    julia  = "0.5",
    deps = nothing,
    make = nothing,
)
