.. title: MADNESS
.. slug: madness
.. date: 2021-01-15 16:30:56 UTC-05:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
.. has_math: true

------------
Introduction
------------

.. figure:: /files/3Dmesh.jpg
    :alt: Different 3D mesh resolutions.
    :align: right
    :width: 450
    :figwidth: 450

    **Fig. 1** A finite element grid of a three dimensional problem domain for 
    slightly different resolutions have a vastly different number of elements.
    
Partial Differential Equations (PDE) are used to approximate solutions to a variety of
real world problems.
MADNESS (Multiresolution ADaptive Numerical Environment for Scientific Simulation) is
a framework written in C++ for solving differential (and integral) equations efficiently
on High Performance Compouters (HPC).

A fist step to learning MADNESS, is understanding the most popular model for solving PDSs.
The `finite element method`_ scheme discretizes space (divide it into boxes) and then
creates functions and opperators to approximate the solution on the mesh (the discretized space).
While this popular approach works for a wide variety of problems, it breaks down for
high-dimension problems that requres resoltion in multiple length-scales.

.. table:: Memory as a function of :math:`N_{size}`.
    :class: float-left

    +----------------+----------------+
    | \\[N_{side}\\] | Memory         |
    +----------------+----------------+
    | 4              | 64             |
    +----------------+----------------+
    | 6              | 216            |
    +----------------+----------------+
    | 8              | 512            |
    +----------------+----------------+
    | 10             | 1000           |
    +----------------+----------------+

As a practical example, suppose you are interested in modeling 
three dimensional water waves on finite element grid.
Now suppose you need to include the interaction of the large ocean waves with the small waves
of an outboard motor; this is a problem with multiple length scales.
Large waves requires a large simulation volume.
Small waves requires a high resolution of the mesh; this requires many points and consumes lots of memory.
This algorithm will also scale poorly when you need to increase the resolution:
increase :math:`N_{size}`, for 

\\[\\text{Memory size} = O(N_{side}^3). \\]

A high-resolution problem that spans multiple length-scales is the
Achilles' heel of the finite element method. For performance, engineers choose a
model with the fewest number of dimensions that will completely capture phenomena
of interest. For instance, when modeling the effects of a linearly-polarized 
laser on a cylindrically symmetric system, a 2D simulation will capture all detail.
However, an elliptically-polarized laser breaks the cylindrical symmetry requiring
a 3D simulation volume.


----------------------------------------
MADness: a Multiresolution ADaptive mesh
----------------------------------------

.. figure:: /files/madness1.png
    :alt: A multiresolution mesh
    :align: right
    :width: 300
    :figwidth: 350

    **Fig. 2** A multiresolution mesh has more than one size box in the grid.
    An adaptive grid places extra grid points just where they are needed.

One way of solving the issue of multiple length-scales on a high-dimentional 
domain is to introduce a Multiresolution (variable-size) mesh
shown in Fig. 2.  Multiresolution is the M in the MADNESS acronym.

Grid point placement is challenge on a multiresolution grid is a challenge.
Will small ripples stay in one place or will they
move over time?  To solve this issue, MADNESS uses an ADaptive (mADness) mesh:
one that changes to meet the needs of the function being modeled. If you're
interested in the mathematical details of adaptive refinement, see Section 2.1
of our `SIAM Publication`_.

----------------------------------------------------------
madNESS: a Numerical Environment for Scientific Simulation
----------------------------------------------------------

This numerical environment for scientific simulation (madNESS) consists of the following
features:

- The illusion of "basis-free" computing.
- A library of fast, arbitrarily-accurate math functions and operators.
- A parallel runtime environment engineered for load balancing hundreds of thousands of cores.
- An API for representing function and operators optimized for scaling to large
  numbers of processors.

.. sidebar:: Case Study: poorly-designed software

    In the early days, much was learned about engineering HPC applications by trial and error.
    For instance, given a cluster of 64 CPUs one might write a 3D finite element algorithm 
    that allocated 1 CPU for each element of a 4x4x4 grid (see Fig. 1).
    This is a poor design-choice because it links in the computational architecture to the
    problem and would make it difficult to scale to larger number of processors.
    Hard-coding the computational architecture into the code, is one such example.

    Such poorly engineered software prevents users from taking advantage of future
    computing power -- continued computational growth of `Moore's Law`_.
    This usually the result of professionals working outside of their area of expertice.
    For instance in rival computational frameworks, the programmer often has to work
    with computational objects that do not map onto the physical quantity.
    This forces the programer to think in computational
    (rather than physical) abstractions.  MADNESS hides computational detail from its
    function objects so the programmer can write code that directly maps to the 
    physical equation of interest.

"Basis-free" computing
----------------------

Many chemical systems are efficiently modeled using a molecular orbit basis.
Since these basis functions refelcts the symmetry of the system, processes near the ground state
are accurately described with only a few functions; this is referred to as a sparce basis it
is seen as a good thing.

Conversely, a poorly-choosen basis, will need lots of basis functions to describe the same process.
However, as one is interested in more energetic processes, the standard basis ceases to be sparce;
that is many many functions are required for the answer to converge. Brute-force, finite element schemes
are considered dense (computationally expensive), for each box is basis function and there are many boxes.

MADNESS aims at acheiving the best of both worlds. Like the finite element scheme it avoids
systematic basis set error, but with much fewer basis functions.

HPC API
-------
MADNESS provides fast, accurate functions for solving differential equations in
one to six dimensions. These operations include linear algebra, numerical
differentiation and integration and integral convolution.


Load-balancing
--------------
There are physical limits on processor *speed*; for this reason, HPC is synonomous with distributed computing.
Today, the fastest computers have the most processors.
Computers with thousands of available processors are no longer rare at universities and governemnt labs.
However, writing efficient code to use of these computers is a challenge.

An important test for HPC software is the **scaling test**: benchmarking
code speed as a function of the number of processors on which it is run.
Writing code that scales linearly is the holy grail in HPC; it means the software
uses more processors perfectly efficiently.
Typically, more processors bring more speed, but at some point the law of diminishing
returns takes over.

MADNESS's team engingeered a task-queue to hide interprocessor communication latency. 
To learn more about the task queue read Section 4 of the `SIAM publication`_.


HPC Libraries
-------------
Creating code that can take advantage of modern supercomputers can be a career.
Unfortunately, most scientists already have a career, and can't afford to put it
on hold while learning the hoops of distributed computing.  
In the spirit of standing on the shoulders of giants, here is a list of 
of technologies that MADNESS uses to allowing average programmers to "see further."

- **Global Arrays** an API for shared memory programming on distributed memory computers.
- **MPI** Message Passing Interface for distributed-memory parallel programming.
- **OpenMP** an interface to shared-memory parallel programming.
- **Pthreads** an thread execution model governing non-concurrent bundles of computation.
- **Futures** a C++ standard providing synchronization across threads.


References
----------
The `SIAM publication`_ is a scholarly introduction to the mathematics of MADNESS
that describes the distributed computing technologies it relies on and reviews some scientific applications.

My `Physics Review A publication`_ introduces MADNESS to the atomic physics community. 

Here is a brisk, 15-minute overview of MADNESS from its founder Robert Harrison.

.. youtube:: dBwWjmf5Tic

.. _`Moore's Law`: https://en.wikipedia.org/wiki/Moore's_law
.. _`finite element method`: https://en.wikipedia.org/wiki/Finite_element_method
.. _`atomic force microscope`: https://en.wikipedia.org/wiki/Atomic_force_microscopy
.. _`Quantum Made Simple`: http://toutestquantique.fr/en/afm/
.. _`SIAM Publication`: https://amath.colorado.edu/faculty/beylkin/papers/H-B-B-C-F-F-G-etc-2016.pdf
.. _`Physics Review A Publication`: /files/Vence01PRA.pdf
