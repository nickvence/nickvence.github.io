.. title: Research
.. slug: research
.. date: 2021-01-07 11:09:07 UTC-05:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text

.. class:: lead

This page highlights the technology of my academic projects.
For an easy-to-follow introduction to the science, follow the links.

`Laser-atom interaction`_
-------------------------


.. image:: /images/ionization.jpg
    :width: 200
    :align: left
    :alt: atomic ionization
    :target: `laser-atom interaction`_

In graduate school I studied laser-atom interactions using
High Performance Computing at Oak Ridge National Laboratory.
MADNESS_, our C++ framework, used a Futures-based task-queue
that implemented both MPI and OpenMP to maximize the
performance on large distributed-memory architectures.

Department of Energy (DOE) funding prioritized an interest in how
our performance scaled as we increased the number of cores (processors).

On the applications side, we used an integral solution to the
time-dependent Schrodinger wave equation.
While we relied on the GNU Scientiific Library and Intel MKL for mathematical support,
one particularly exotic special function required an alternating series approximation.
Since subtration of similar sized terms is notorious for accumulating
numerical error, we implemented a custom 128-bit precision floating point implementation.

Once we built the computation engine, we were able to run our
experiment on the Cray supercomputers_.  This generated lots of data,
and python did a great job of processing the output extracting
the data and auto-generating LaTeX code for quick reporting.

--------

MADNESS_
--------

.. image:: /images/madness1.png
    :width: 200
    :align: left
    :alt: Multiresolution mesh
    :target: madness_

The computational framework of MADNESS (Multiresolution ADaptive Numerical 
Environment for Scientific Simulation) is a collection of distributed
computing technologies allowing career scientists to leverage High Performance
Computing (HPC).

--------

`Concave slope`_
----------------
.. image:: /images/discrete-slope.png
    :width: 200
    :align: left
    :alt: The slope of a hill 
    :target: /concave-slope

Used Mathematica to solve a 1D boundary value problem and
demonstrate the validity of an integral approximation of 
the soil stability equation.

--------

`Cell-phase predictor`_
-----------------------

.. image:: /images/celegans.jpg
    :width: 200
    :align: left
    :alt: worm stem cells
    :target: /predicting-cell-phase

My first post-doc fellowship was classifying the phase of
stem cells in small worms using supervised machine learning.
I improved the accuracy of our support vector machine from
85% to 90%.

-------------

`Proton Computed Tomography`_
-----------------------------

.. image:: /images/pCT3.png
    :width: 200
    :align: left
    :alt: proton Computed Tomography scanner
    :target: /proton-computed-tomography

Proton Computed Tomography uses protons to create 3-dimensional
images; this will be especially useful for doctors planning
proton radiation treatment for patients with head and neck tumors.

Nuclear Instrumentation Modules (NIM) and an oscilloscope were
indespensible in setting up the proton beam.

Used Arduino-based robotics to automate repetative and radiation-intensive tasks.
Created a sub-millimeter precision positioning system (for
precision radiation delivery) with a collection of Newport
stages controlled with python driver.

Callibrated the five-stage,scintillating proton energy detector
using ROOT, a C++ framework developed at CERN.


------------

Radiosurgery_
-------------

.. image:: /images/rat.png
    :width: 200
    :align: left
    :alt: small animal CT-scan
    :target: /radiosurgery

Several doctors were well on their way to replacing a
catheter-based, cardiac arrhythmia surgery with a non-invasive
proton beam procedure. This reserach project used a rat model
to quantify radiation deposition in a living subject.

Created a robotic rat-phantom for proton-beam target practice
using Arduino-control servo motors modeling respiration and heartbeat.

Created an Arduino-controlled, mechanical-video interface to communicate rat
breathing to gate CT-scanner.

Created proton gantry alignment procedure using alignment-phantom,
proton-sensitive film, Matlab image processing algorithm, and
linear transformation to determine and correct for systematic
proton-beam error.

.. _`Laser-atom interaction`: /laser-atom-interaction
.. _`Concave slope`: /concave-slope
.. _`Cell-phase predictor`: /predicting-cell-phase
.. _`Proton computed tomography`: /proton-computed-tomography
.. _MADNESS: /madness
.. _Radiosurgery: /radiosurgery
.. _supercomputers: https://www.top500.org
