using ScriptReports
using Documenter

DocMeta.setdocmeta!(ScriptReports, :DocTestSetup, :(using ScriptReports); recursive=true)

makedocs(;
    modules=[ScriptReports],
    authors="Tejas Ramdas <tejas.ramdas@gmail.com> and contributors",
    sitename="ScriptReports.jl",
    format=Documenter.HTML(;
        canonical="https://tejasramdas.github.io/ScriptReports.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/tejasramdas/ScriptReports.jl",
    devbranch="main",
)
