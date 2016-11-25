"""
$(SIGNATURES)

Compute the minimum sample size needed for the desired power, type I error rate and effect size

Arguments
---------
* `Test` -- The test for calculating the power
* `std` -- Standard deviation
* `power` -- Power
* `alpha` -- Desired type I error rate
* `side` -- Side of the test, "two" is two-sided, "one" is one-sided
"""
function sample_size{T <: TrialTest}(
    test::T;
    power::Real = nothing,
    std::Union{Real, Tuple{Real, Real}, Void} = nothing,
    alpha::Real = 0.05,
    side::String = "two",
)
    # Transcode side
    side = lowercase(side)
    # check_args(T, 2, delta, std, power, alpha, side)
    gap(n::Real) = analytic_power(test, n = n, std = std, alpha = alpha, side = side) - power
    # Round to the minimum integer that is larger than the root
    return round(fzero(gap, 2, MAXSAMPLESIZE), RoundUp)

end
