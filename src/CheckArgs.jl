"""
$(SIGNATURES)

# Details
Check if the arguments are right
"""
function check_args(
    T,
    n::Union{Real, Tuple},
    delta::Real,
    std::Union{Real, Tuple},
    power::Real,
    alpha::Real,
    side::String,
)

    if isa(n, Real)

        if !(2.0 <= n < Inf)

            error("sample size must be in [2.0, Inf)")

        end

    else

        if !(2.0 <= min(n...) < Inf & max(n...) < Inf)

            error("sample sizes must both be in [2.0, Inf)")

        end

    end

    if (typeof(T) == OneSampleProp) | (typeof(T) == TwoSampleProp)

        if !(-1 < delta < 1)

            error("effect size must be in (-1, 1)")

        end

    elseif !((-Inf < delta < 0) | (0 < delta < Inf))

        error("effective size cannot be 0")

    end

    #=
    # For One sample
    if (typeof(T) == OneSampleProp) | (typeof(T) == TwoSampleProp)

        warn("σ is not used")

    elseif isa(σs, Real)

        if !(0.0 < σs < Inf)

            error("σ must be in (0.0, Inf)")

        end

    else

        if !(0.0 < min(σs...) < Inf)

            error("σs must both be in (0.0, Inf)")

        end

    end
    =#

    # The power should between 0 and 1
    if !(0.0 < power < 1.0)

        error("power must be in (0.0, 1.0)")

    end

    # The alpha should between 0 and 1
    if !(0.0 < alpha < 1.0)

        error("alpha must be in (0.0, 1.0)")

    end

    # The test should always be two-sided or one-sided
    if !in(side, ("two", "one"))
        error("side must be in ('two', 'one')")
    end

end
