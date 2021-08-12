.. title: graph01
.. slug: graph01
.. date: 2021-07-07 15:28:47 UTC-04:00
.. tags: probability, ggplot
.. category: 
.. link: 
.. description: 
.. type: text
.. has_math: true

=========================
Probability distributions
=========================
ROUGH DRAFT

TODO: place equation on chart

Suppose you have a rare event, e.g. a machine that has a 10% chance of breaking
each day. The probability that it fails after X days is given by an
`exponential distribution`_. 
This proability density function (pdf) is the proabability per day
(dark gray).

$$ f(X) = \\lambda e^{-\\lambda X} $$

The probability that it survives X days is given by the *cumulative*
probability distribution (gray), which adds up (sums/integrates)
the probability up to that day, and hence is a monotonically increasing
function.

$$ F(X) = \\int_0^X f(t) dt = 1 - e^{-\\lambda X} $$

.. image:: /galleries/graph/cumulative_dist.png

.. include:: listings/cumulative_dist.R
    :code: R
    
.. _`exponential distribution`: https://en.wikipedia.org/wiki/Exponential_distribution
 
