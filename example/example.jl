using TrialSampleSize

# Calculate the power for one-sample proportion test
#=
True proportion: 0.9
Proportion under the null: 0.5
Std: 1
Sample Size: 50
=#
# Calculate power
power(OneSampleProp(0.9, 0.6), n = 50)
# Calculate sample size
sample_size(OneSampleProp(0.9, 0.6), power = 0.8, alpha = 0.05)
