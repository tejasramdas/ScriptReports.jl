module ScriptReports

export generate_report

using Literate, Weave


function generate_report(in_path::String; out_path::String = ".")
    fname=split(basename(in_path),".")[1]
    tmpd=mktempdir()
    Literate.markdown(in_path, tmpd;flavor=Literate.CommonMarkFlavor(),credit=false)
    temp_md=readlines(tmpd*"/"*fname*".md")
    add_dropdown = """```julia; echo=false
                    struct BeginDropdown
                    title::String
                    end
                    BeginDropdown() = BeginDropdown(\"\")
                    Base.show(io::IO, m::MIME"text/html", b::BeginDropdown) = write(io, \"<details><summary style=\\\"display:list-item\\\">                    \$(b.title)</summary>\")
                    struct EndDropdown
                    end
                    Base.show(io::IO, m::MIME\"text/html\", e::EndDropdown) = write(io, \"</details>\")
                    ``` 

                    """ 
    temp_md = vcat(temp_md,add_dropdown)
    for i in 1:length(temp_md)
        if length(temp_md[i]) >=4 && temp_md[i][1:4]=="````"
            temp_md[i] = "```"*temp_md[i][5:end]
        end
        if temp_md[i]=="hidecode=true"
            temp_md[i-1] *= ";echo=false;"
        end
    end
    jlf=open("$(split(in_path,".")[1]).jmd", "w")
    for i in temp_md
        println(jlf,i)
    end
    close(jlf)
    @info "Saving HTML file to $(out_path * "/" * fname * ".html")"
    weave("$(split(in_path,".")[1]).jmd")
    if isfile(out_path * "/" * fname * ".html")
        return true
    end
end

end
