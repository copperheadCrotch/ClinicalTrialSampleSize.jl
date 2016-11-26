# Check arguments for power calculation
function check_args_power{T <: TrialTest}(
    test::T;
    n::Union{Real, Void} = nothing,
    std::Union{Real, Tuple{Real, Real}, Void} = nothing,
    alpha::Real = 0.05,
    side::String = "two",
)

    if isa(n, Real)

        if !(2.0 <= n < Inf)

            error("sample size must be in [2.0, Inf)")

        end # end if

    else

        error("sample size must be specified")

    end # end if


    if isa(test, Union{OneSampleProp, OneSamplePropInferior, OneSamplePropSuperior,
      OneSamplePropEqual, TwoSampleProp, TwoSamplePropInferior,
      TwoSamplePropSuperior, TwoSamplePropEqual, McNemarProp})

        if !isa(std, Void)

            warn("standard deviation is not used in the calculations")

        end # end if

    elseif isa(std, Real)

        if !(0.0 < std < Inf)

            error("standard deviation must be in (0.0, Inf)")

        end # end if

    elseif isa(std, Tuple{Real, Real})

        if !((min(std...) > 0.0) & (max(std...) < Inf))

            error("standard deviaitons must both be in (0.0, Inf)")

        end # end if

    else

        error("standard deviaiton must be specified")

    end # end if

    # The alpha should between 0 and 1
    if !(0.0 < alpha < 1.0)

        error("type I error rate must be in (0.0, 1.0)")

    end # end if

    # The test should always be two-sided or one-sided
    if !in(side, ("two", "one"))

        error("side must be in 'two' or 'one'")

    end # end if

end # end function


# Check arguments for sample size calculations
function check_args_sample_size{T <: TrialTest}(
    test::T;
    power::Union{Real, Void} = nothing,
    std::Union{Real, Tuple{Real, Real}, Void} = nothing,
    alpha::Real = 0.05,
    side::String = "two",
)


    if isa(power, Real)

        # The power should between 0 and 1
        if !(0.0 < power < 1.0)

            error("power must be in (0.0, 1.0)")

        end # end if

    else

        error("power must be specified")

    end # end if

    if isa(test, Union{OneSampleProp, OneSamplePropInferior, OneSamplePropSuperior,
      OneSamplePropEqual, TwoSampleProp, TwoSamplePropInferior,
      TwoSamplePropSuperior, TwoSamplePropEqual, McNemarProp})

        if !isa(std, Void)

            warn("standard deviation is not used in the calculations")

        end # end if

    elseif isa(std, Real)

        if !(0.0 < std < Inf)

            error("standard deviation must be in (0.0, Inf)")

        end # end if

    elseif isa(std, Tuple{Real, Real})

        if !((min(std...) > 0.0) & (max(std...) < Inf))

            error("standard deviaitons must both be in (0.0, Inf)")

        end # end if

    else

        error("standard deviaiton must be specified")

    end # end if

    # The alpha should between 0 and 1
    if !(0.0 < alpha < 1.0)

        error("type I error rate must be in (0.0, 1.0)")

    end # end if

    # The test should always be two-sided or one-sided
    if !in(side, ("two", "one"))

        error("side must be in 'two' or 'one'")

    end # end if

end # end function
