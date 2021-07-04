.. title: MADNESS
.. slug: madness
.. date: 2021-01-15 16:30:56 UTC-05:00
.. tags: science, math, algorithm, differential equations
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

    **Fig. 1** The number of boxes in a three-dimensional, finite-element grid is
    vastly different for a slightly different resolutions: see the numbers in table.
    
Partial Differential Equations (PDE) are used to approximate solutions to a variety of
real world problems.
MADNESS (Multiresolution ADaptive Numerical Environment for Scientific Simulation) is
a framework written in C++ for solving differential (and integral) equations efficiently
on High Performance Compouters (HPC).

A first step to learning MADNESS, is understanding the most popular model for solving PDEs:
the `finite element method`_ scheme which discretizes space (dividing it into boxes) and then
creates functions and opperators to approximate the solution on the mesh (the discretized space).
While this popular approach works for a wide variety of problems, it breaks down for
high-dimension problems that require resolution at multiple length-scales.

.. table:: Memory usage as a function of :math:`N_{size}`.
    :class: float-left m-4 table-sm table-striped 

    +----------------+----------------+
    | \\[N_{side}\\] | \\[N_{total}\\]|
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
three dimensional (3D) water waves on finite element grid.
Now suppose you need to include the interaction of the large ocean waves with the
small waves of an outboard motor; this is a problem with multiple length scales.
Large waves require a large simulation volume, and small waves require small boxes.
This combination uses lots of boxes, lots of memory, and will scale poorly when increasing the resolution.
The memory footprint is proportional to the total number of boxes or elements :math:`N_{total}`, for 

\\[\\text{Memory size} = O(N_{side}^3). \\]

A high-dimension, high-resolution problem is the weakness of the finite element method.
When possible, it is advantagous to use the fewest number of dimensions that adequately
capture the phenomena. For instance, given a spherically symmetric electron cloud in the
presence of a linearly-polarized electric field, cylindrical symmetry is imposed on the
system. This makes a 2D simulation is sufficient; however, an elliptically-polarized laser,
however, breaks the cylindrical symmetry requiring a 3D simulation.


1D and most 2D problems can be solved on personal computers; however, when increasing
complexity outpaces the abilities of a personal computer, small workstations (or cloud
computing) are the next solution.  These have a handful of processors (with dozens
of computing cores) and can be built with over 100 GB of shared memory. In shared memory
computers, memory size (or processing power) is the bottlneck.
However, some simulations (supernova, weather, molecular dynamics, etc.) require the
largest computers that use distributed memory.
In these systems, interprocessor communication becomes the bottleneck. 
While supercomputers will always be improving bus speed, fiber optic gates, interconnects,
network topology, and routing algorithms; users must create code to take advantage of
these technologies.


----------------------------------------
MADness: a Multiresolution ADaptive mesh
----------------------------------------

.. figure:: /files/madness1.png
    :alt: A multiresolution mesh
    :align: right
    :width: 300
    :figwidth: 350

    **Fig. 2** A multiresolution mesh has more than one size box in the grid,
    and an adaptive grid places extra grid points just where they are needed.

One way of solving the issue of multiple length-scales on a high-dimentional 
domain is to introduce a multiresolution (variable-size) mesh
shown in Fig. 2.  Multiresolution is the M in the MADNESS acronym.

Multiresolution grid placement is challenge: will small ripples
stay in one place or will they move over time?
To solve this issue, MADNESS uses an ADaptive (mADness) mesh:
one that changes to meet the needs of the function being modeled. If you're
interested in the mathematical details of adaptive refinement, see section 2.1
of our `SIAM Publication`_.

----------------------------------------------------------
madNESS: a Numerical Environment for Scientific Simulation
----------------------------------------------------------

This numerical environment for scientific simulation (madNESS) consists of the following
features:

- A library of fast, arbitrarily-accurate math functions acting on simulation-domain functions.
- The illusion of "basis-free" computing.
- A parallel runtime environment engineered for load balancing on hundreds of thousands of cores.
- An overview of the HPC libraries upon which MADNESS is based.

.. sidebar:: Case Study 
    :subtitle: Poorly-designed software

    In the early days, much was learned about engineering HPC applications by trial and error.
    For instance, when writing a 3D finite element algorithm on a 64 CPU-cluster,
    one might naively allocate 1 CPU for each element of a 4x4x4 grid (see Fig. 1).
    This poor design-choice locks the hardware to the simulation-parameters, 
    limiting code portability and a future growth in computing power: `Moore's Law`_.

    Many HPC applications are writen by scientists working outside their domain of expertice.
    Over the years HPC frameworks have evolved to ease the transition, and MADNESS
    has had the benefit of standing on the shoulders of giants.
    One such luxury is having computational objects
    that directly correspond to terms in the equation we are modeling.
    Other HPC frameworks, by contrast, force programers to work with computational
    objects that are non-physical abstractions (e.g. processorID).
    These hurdles make HPC development needlessly complex. 

HPC API
-------
A 3D finite-element scheme stores the data of the simulation function
(ocean waves, or electron wave function) in fixed, 3D array.
MADNESS functions, due to their adaptive nature are stored as a tree.
To facilitate fast guaranteed-precision math on this tree, 
MADNESS provides an Application Programming Interface (API)
for common operations for functions of one to six dimensions.
These operations include: arithmetic, linear algebra, numerical
differentiation and integral convolution.
This API enables the creation of code that often reads like the
math equation that it is modeling. For an example see section 3 of the `SIAM publication`_.

"Basis-free" computing
----------------------
Many simple chemical systems are efficiently modeled using a molecular-orbit basis.
These basis functions refelct the symmetry of the system, and chemical processes near the
ground state are accurately described with just a few molecular-orbital, basis functions.
This is referred to as a sparce basis, and it is a good thing.

While a sparce basis makes for efficient computation, it has a dark side: basis error.
For low-energy processes (between the ground state and first excited state), the
basis error is small. However, as higher energy chemical processes involve
more exotic excitations which, in turn, require more basis functions and amplify
basis error. For these systems, MADNESS (like a finite element scheme)
becomes an attractive solution that doesn't have basis error.
However, being more memory-efficient MADNESS outperforms the finite elements scheme
which is seen as a dense solution to the problem.


Load-balancing
--------------
There are physical limits on processor speed;
for this reason, HPC is synonomous with distributed computing.
Today, the fastest computers have the most processors.
Computers with thousands of available processors are no longer rare at universities and governemnt labs.
However, writing efficient code to use of these computers is a challenge.

An important test for HPC software is the **scaling test**: benchmarking
code speed as a function of the number of processors on which it is run.
Creating code whose speed scales linearly with the number of processors is the holy grail in HPC.
Scaling measures the efficiency of processor use.  While more processors usually brings more speed,
in reality the law of diminishing returns usually takes over.

MADNESS successfully scales to over thousands of processors;
this is due in part to its internal compartmentalization of work for
its task-queue that is designed to hide interprocessor communication latency. 
To learn more about the task queue read section 4 of the `SIAM publication`_.


HPC Libraries
-------------
Creating code that can take advantage of modern supercomputers can be a career.
Unfortunately, most scientists already have a career, and can't afford to put it
on hold while mastering distributed computing software development.  
The following technologies allow average programmers (through MADNESS)
to stand on the shoulders of giants:
- **Global Arrays** an API for shared memory programming on distributed memory computers.
- **MPI** Message Passing Interface for distributed-memory parallel programming.
- **OpenMP** an interface to shared-memory parallel programming.
- **Pthreads** a thread execution model governing non-concurrent bundles of computation.
- **Futures** a C++ standard providing synchronization across threads.


------------
Publications
------------
The `SIAM publication`_ is a scholarly introduction to the mathematics of MADNESS
that describes the distributed computing technologies it relies on and reviews some scientific applications.

My `Physics Review A publication`_ solves the time-dependent Schrodinger equation in a stong laser field
using MADNESS.  It introduces MADNESS to the atomic physics community.

Here is a brisk, 15-minute overview of MADNESS from its founder Robert Harrison.

.. youtube:: dBwWjmf5Tic

.. _`Moore's Law`: https://en.wikipedia.org/wiki/Moore's_law
.. _`finite element method`: https://en.wikipedia.org/wiki/Finite_element_method
.. _`atomic force microscope`: https://en.wikipedia.org/wiki/Atomic_force_microscopy
.. _`Quantum Made Simple`: http://toutestquantique.fr/en/afm/
.. _`SIAM Publication`: https://amath.colorado.edu/faculty/beylkin/papers/H-B-B-C-F-F-G-etc-2016.pdf
.. _`Physics Review A Publication`: /files/Vence01PRA.pdf
