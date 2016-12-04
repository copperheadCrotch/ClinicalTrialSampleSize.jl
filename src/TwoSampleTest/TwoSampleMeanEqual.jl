"""
$(TYPEDEF)

Two sample equivalence test for mean

Constructors
------------
* `TwoSampleMeanEqual(mu1::Real, mu2::Real, k::Real, delta::Real, stdunknown::Bool)`

Arguments
---------
* `mu1`: Mean of group 1

* `mu2`: Mean of group 2

* `k`: Allocation ratio of the groups, k = n(group1) / n(group 2)

* `delta`: Non-inferiority/Superiority Margin

* `stdunknown`: If the population standard deviation is known, default = false,
when the population parameter is known, the power / sample size are calculated based
on a standard normal distribution, otherwise a t distribution will be used

Fields
------
$(FIELDS)
"""
type TwoSampleMeanEqual <: TrialTest
    mu1::Real
    mu2::Real
    k::Real
    delta::Real
    stdunknown::Bool

    # Validator
    function TwoSampleMeanEqual(mu1, mu2, k, delta, stdunknown = false)

        if !((-Inf < mu1 < Inf) & (-Inf < mu2 < Inf))

            error("Mean value must be in (-Inf, Inf)")

        end # end if

        if !(0 < k < Inf)

            error("Allocation ratio must be in (0, Inf)")

        end # end if

        if !(0 <= delta < Inf)

            error("The superiority margin δ must be in [0 , Inf)")

        end # end if
        new(mu1, mu2, k, delta, stdunknown)

    end # end function

end # end type


# Two-sample equivalence test for mean, equal standard deviaiton
function hypotheses{T <: TwoSampleMeanEqual}(test::T, n::Real, std::Real, alpha::Real, side::String)

    diff = abs(test.mu1 - test.mu2) - test.delta
    se = sqrt(1 / n + 1 / (test.k * n)) * std
    ts = diff / se
    if test.stdunknown == false

        p = 2 * (cdf(ZDIST, ts - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -ts - quantile(ZDIST, 1 - alpha))) - 1

    else

        p = 2 * (cdf(TDist(n + test.k * n - 2), ts - quantile(TDist(n + test.k * n - 2), 1 - alpha)) +
            cdf(TDist(n + test.k * n - 2), -ts - quantile(TDist(n + test.k * n - 2), 1 - alpha))) - 1

    end # end if
    # power_result(test, p)
    return p

end # end function


# Two-sample equivalence test for mean, unequal standard deviation
function hypotheses{T <: TwoSampleMeanEqual}(test::T, n::Real, std::Tuple{Real, Real}, alpha::Real, side::String)

    diff = abs(test.mu1 - test.mu2) - test.delta
    se = sqrt(std[1] ^ 2 / (test.k * n) + std[2] ^ 2 / n)
    ts = diff / se
    if test.stdunknown == false

        p = 2 * (cdf(ZDIST, ts - quantile(ZDIST, 1 - alpha)) + cdf(ZDIST, -ts - quantile(ZDIST, 1 - alpha))) - 1

    else

        p = 2 * (cdf(TDist(n + test.k * n - 2), ts - quantile(TDist(n + test.k * n - 2), 1 - alpha)) +
            cdf(TDist(n + test.k * n - 2), -ts - quantile(TDist(n + test.k * n - 2), 1 - alpha))) - 1

    end # end if
    # power_result(test, p)
    return p

end # end function
