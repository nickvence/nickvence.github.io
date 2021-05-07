.. title: Concave slope
.. slug: concave-slope
.. date: 2021-02-05 14:14:01 UTC-05:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
.. has_math: true

.. figure:: /files/discrete-slope.png
    :align: right
    :alt: Finite slope approximation
    :figwidth: 400
    :width: 400

    **Fig. 1** The representation of a discrete slope as modeled by metal sheets 
    resting on ping pong balls.

Landscape developers (civil engineers) often need a hill
decline in elevation as rapidly as possible. While the construction of a retaining
wall is an expensive last resort, most prefer an inexpensive, aesthetically-pleasing hillside.

Before Global Positioning Systems (GPS) spawned precision-tractors, engineers created
constant-slope hillsides.  Unfotunately, this linear slope is not

- optimized for a rapid elevation decline
- optimized for errosion, and 
- aesthetically pleasing.

Now that GPS-tractors can make concave slopes, the world will benefit from optimizing
their shape.

In the 1960s, Sokolovskii described the optimal form of these slopes as the solution
to boundary value problems.
However, `Isaac Jeldes`_, approximated Sokolovski's boundary value problem with a
simple integral.  He tested his approximation's integrity with a finite 
element analysis scheme, and asked me to help him justify approximation theoretically.
Read the paper for the full scoop, but if you're pressed for time, we approximated tangent with
the first term of its Taylor expansion
\\[tan(x) \\approx x.\\]
This is justified for small angles and transforms the differential equation into one
with an integral solution.
This is a big win, for only a small subset of graduate-level engineers solve
non-trivial differential equations; while calculus is a more commonly-used tool
in the enigineers toolbox.

Publication
-----------

`Approximate Solution to the Sokolovskiıĭ Concave Slope at Limiting Equilibrium`_

.. _`Approximate Solution to the Sokolovskiıĭ Concave Slope at Limiting Equilibrium`: /files/Vence02IJG.pdf
.. _`Isaac Jeldes`: https://www.linkedin.com/in/isaac-a-jeldes-halty-ph-d-p-e-55354352/

