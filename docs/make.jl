using DrugInterface
using Documenter, DocumenterVitepress

# Make `using DrugInterface` implicit in every doctest / docstring example block.
DocMeta.setdocmeta!(DrugInterface, :DocTestSetup, :(using DrugInterface); recursive = true)

makedocs(;
    modules = [DrugInterface],
    authors = "Simon Steiger",
    repo = "https://github.com/simonsteiger/02_outcomes",
    sitename = "DrugInterface.jl",
    format = DocumenterVitepress.MarkdownVitepress(
        repo = "https://github.com/simonsteiger/02_outcomes",
        devbranch = "main",
        devurl = "dev",
        build_vitepress = true,
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
    repo = "github.com/simonsteiger/02_outcomes",
    devbranch = "main",
    push_preview = true,
)
