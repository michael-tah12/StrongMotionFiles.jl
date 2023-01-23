using DataFrames

function readrs(file, start=39)
    data = []
    title = ""
    df = DataFrame()
    open(file, "r") do f
        for (i, ln) in enumerate(eachline(f))
            if (i >= start)
                lnarr = split(ln, " ")
                filter!(x -> x != "", lnarr)
                try
                    n = parse.(Float64, lnarr)
                    append!(data, n)
                catch
                    if (title != "")
                        df[!, strip(title)] = data / 100
                    else
                        df[!, "Period"] = data
                    end
                    title = ln
                    data = []
                end
            end
        end
    end
    return df
end

function read(file, start=36)
    data = []
    open(file, "r") do f
        for (i, ln) in enumerate(eachline(f))
            if (i >= start)
                append!(data, parse.(Float64, [ln[i:i+9] for i in 1:10:length(ln)]) / 100)
            end
        end
    end
    return data
end

export read, readrs