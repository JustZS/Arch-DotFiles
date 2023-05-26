#!/bin/python
from scipy.stats import norm
from numpy import sqrt

def calculate_cumulative_probability(lower, upper, mean, std_dev):
    # Calculate the cumulative probability using the norm.cdf() function
    cumulative_prob = norm.cdf(upper, loc=mean, scale=std_dev) - norm.cdf(lower, loc=mean, scale=std_dev)
    return cumulative_prob

# Example usage
lower_bound = input("Lower Bound: ")
upper_bound = input("Upper Bound: ")
mean = float(input("Mean: "))
std_dev = sqrt((mean*(1-mean))/245)

cumulative_probability = calculate_cumulative_probability(float(lower_bound), float(upper_bound), float(mean), float(std_dev))
print("Cumulative Probability:", cumulative_probability)

