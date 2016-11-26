using ClinicalTrialSampleSize
using Base.Test

# test for power calculations
@test_throws ErrorException power(OneSampleMean(0, 9), n = 1, std = 1)
@test_throws ErrorException power(OneSampleMean(0, 9), std = 1)
power(TwoSampleProp(0.9, 0.5, 1), std = 1, n = 20, alpha = 0.05)
@test_throws ErrorException power(TwoSampleMean(0.9, 0.5, 1), n = 20, std = -1,  alpha = 0.05)
@test_throws ErrorException power(TwoSampleMean(0.9, 0.5, 1), n = 20, alpha = 0.05)
@test_throws ErrorException power(TwoSampleMean(0.9, 0.5, 1), n = 20, std = (-0.02, -0.03), alpha = 0.05)
@test_throws ErrorException power(OneSampleMean(0, 9), n = 25, std = 1, alpha = 1.5)
@test_throws ErrorException power(OneSampleMean(0, 9), n = 10, std = 1, alpha = 0.05, side = "greater")

# test for sample size calculations
@test_throws ErrorException sample_size(OneSampleMean(0, 9), power = 1.2, std = 1)
@test_throws ErrorException sample_size(OneSampleMean(0, 9), std = 1)
sample_size(TwoSampleProp(0.9, 0.5, 1), std = 1, power = 0.8, alpha = 0.05)
@test_throws ErrorException  sample_size(TwoSampleMean(0.9, 0.5, 1), power = 0.8, alpha = 0.05)
@test_throws ErrorException sample_size(TwoSampleMean(0, 9, 1), power = 0.9, std = (-2, -3), alpha = 0.05)
@test_throws ErrorException sample_size(TwoSampleMean(0, 9, 1), power = 0.9, std = -1, alpha = 0.5)
@test_throws ErrorException sample_size(TwoSampleMean(0, 9, 1), power = 0.9, std = (2, 3), alpha = 1.5)
@test_throws ErrorException sample_size(OneSampleProp(0.2, 0.5), power = 0.8, std = 1, alpha = 0.05, side = "greater")


return true
