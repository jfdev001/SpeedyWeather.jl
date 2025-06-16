module SpecificHumidityExample 

using SpeedyWeather: SpectralGrid, PrimitiveWetModel, OctahedralGaussianGrid, 
    initialize!, run!, Day, Hour, NetCDFOutput, HumidityOutput, add!,
    GPU, CPU

function main()
    spectral_grid = SpectralGrid(
        trunc=340, Grid=OctahedralGaussianGrid, nlayers=16)

    output = NetCDFOutput(spectral_grid; output_dt=Hour(1))
    add!(output, HumidityOutput())

    model = PrimitiveWetModel(spectral_grid, output=output)
    simulation = initialize!(model)
    run!(simulation, period=Day(10), output=true)
end 


function animate()
    println("not implemented")
end 


end  
