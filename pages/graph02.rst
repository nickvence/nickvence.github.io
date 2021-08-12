.. title: graph02
.. slug: graph02
.. date: 2021-07-13 20:38:42 UTC-04:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
.. has_math: true

===================
Fair or Biased Coin
===================

To test whether a coin is fair, we perform a statistical experiment.
Maybe this coin comes up heads 75% of the time?
While we could flip it once, either event is rather likely.
No, to test if a coin is biased, we must several times before
we provide convincing statistical evidence of bias.

This is a job for Bayesian statistics
We choose to flip our suspect coin 20 times, with the result that 
11/20 of the flips are heads. With this data, we use Bayes' rule:
$$
P(A|B) = \\frac{P(B|A) P(A)}{P(B)}
$$

.. image:: /galleries/graph/fair_bias_coin.png

.. include:: listings/fair_bias_coin.R
    :code: R
