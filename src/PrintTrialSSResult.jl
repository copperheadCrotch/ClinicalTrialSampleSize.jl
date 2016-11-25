# print out the results
function power_result(::Type{OneSampleTTest}, outObj::String, outValue::Real)
    @printf "%s:%.6f" outObj outValue
end

function power_result(::Type{TwoSampleTTest}, outObj::String, outValue::Real)
    @printf "%s:%.6f" outObj outValue
    if outObj == "SampleSize"
        println("\n$outObj is the number in each group")
    end
end

function power_result(::Type{PairedTTest}, outObj::String, outValue::Real)
    @printf "%s:%.6f" outObj outValue
    if outObj == "SampleSize"
        println("\n$outObj is the number of pairs")
    end
end

function power_result(::Type{OneSampleZTest}, outObj::String, outValue::Real)
    @printf "%s:%.6f" outObj outValue
end

function power_result(::Type{TwoSampleZTest}, outObj::String, outValue::Real)
    @printf "%s:%.6f" outObj outValue
    if outObj == "SampleSize"
        println("\n$outObj is the number in each group")
    end
end

function power_result(::Type{OneSamplePropTest}, outObj::String, outValue::Real)
    @printf "%s:%.6f" outObj outValue
end

function power_result(::Type{TwoSamplePropTest}, outObj::String, outValue::Real)
    @printf "%s:%.6f" outObj outValue
    if outObj == "SampleSize"
        println("\n$outObj is the number in each group")
    end
end
