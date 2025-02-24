### ScriptReports.jl

ScriptReports.jl is a Julia package that allows you to create reports from Julia scripts using a combination of [Literate.jl](https://github.com/fredrikekre/Literate.jl) and [Weave.jl](https://github.com/JunoLab/Weave.jl). [LiterateWeave.jl](https://github.com/baggepinnen/LiterateWeave.jl) does something similar, but I added a few more features including hiding source code and using ```<details>``` blocks. 

##### Usage

This package exports a single function called ```generate_report``` that takes in a ```.jl``` file interleaved with Markdown, runs it through Literate to generate a ```.jmd``` file with some modifications, and then runs it through Weave to generate an HTML file. It supports additional decorators to allow for hiding source code and using ```<details>``` blocks. This will hopefully support more source file parsing and customization in the future. 

See the ```examples``` folder for a quick tutorial. The final output looks something like [this](https://html-preview.github.io/?url=https://github.com/tejasramdas/ScriptReports.jl/blob/main/example/example.html).

##### Credits
Thanks to the developers of Literate and Weave for two awesome packages. Thanks also [baggepinnen](https://github.com/baggepinnen/) for their package and to [mtfishman](https://github.com/mtfishman) for [this snippet](https://github.com/JunoLab/Weave.jl/issues/425#issuecomment-1158138615_).
