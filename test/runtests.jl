using ScriptReports
using Test

@testset "ScriptReports.jl" begin
    # Write your tests here.
    @test generate_report("../example/example.jl")
end
