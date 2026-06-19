using DrugInterface
using Documenter, DocumenterVitepress

# Make `using DrugInterface` implicit in every doctest / docstring example block.
DocMeta.setdocmeta!(DrugInterface, :DocTestSetup, :(using DrugInterface); recursive = true)

makedocs(;
    sitename = "DrugInterface.jl",
    authors = "Simon Steiger",
    modules = [DrugInterface],
    format = DocumenterVitepress.MarkdownVitepress(
        repo = "https://github.com/simonsteiger/DrugInterface.jl",
        devbranch = "main",
        devurl = "dev",
    ),
    pages = [
        "Home" => "index.md",
        "Getting Started" => "getting_started.md",
        "The Interface" => "interface.md",
        "API Reference" => "api.md",
    ],
    warnonly = true,
)

DocumenterVitepress.deploydocs(;
    repo = "github.com/simonsteiger/DrugInterface.jl",
    target=joinpath(@__DIR__, "build"),
    devbranch = "main",
    push_preview = true,
)
