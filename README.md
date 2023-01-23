# StrongMotionFiles.jl

The **StrongMotionFiles.jl** Package provides function to read strong motion cd (*.smc) earthquake data provided by sources like [USGS](https://www.usgs.gov/). 

## Usage
### Read time series data

You can read acceleration, velocity and displacement data with the `read` function, which returns an array with the timeseries data of a specified `file`.

```julia
data = read("file.smc")
```

### Read response spectrum

You can also read response spectrums with

```julia
df = readrs("filers.smc")
```

which returns a `DataFrame` object with all the response spectrums defined in the `filers.smc`.