"""

$(SIGNATURES)

Compute the power of the trial, given the sample size, desired type I error rate and effect size.

Arguments
---------
* `Test` -- The test for calculating the power
* `n` -- Sample size
* `std` -- Standard deviation
* `alpha` -- Desired type I error rate
* `side` -- Side of the test, "two" is two-sided, "one" is one-sided
"""
function power{T <: TrialTest}(
    test::T;
    n::Union{Real} = nothing,
    std::Union{Real, Tuple{Real}, Void} = nothing,
    alpha::Real = 0.05,
    side::String = "two",
)
    # Transcode side
    side = lowercase(side)
    # check_args(T, ns, diff, std, 0.8, alpha, side)

    # Calculate power
    return hypotheses(test, n, std, alpha, side)

end


"""

$(SIGNATURES)

Compute the power of the trial without checking arguments, given the sample size, desired type I error rate and effect size.

Arguments
---------
* `Test` -- The test for calculating the power
* `n` -- Sample size
* `std` -- Standard deviation
* `alpha` -- Desired type I error rate
* `side` -- Side of the test, "two" is two-sided, "one" is one-sided
"""
function analytic_power{T <: TrialTest}(
    test::T;
    n::Union{Real} = nothing,
    std::Union{Real, Tuple{Real}, Void} = nothing,
    alpha::Real = 0.05,
    side::String = "two",
)
    # Transcode side
    side = lowercase(side)
    # check_args(T, ns, diff, std, 0.8, alpha, side)

    # Calculate power
    return hypotheses(test, n, std, alpha, side)

end
