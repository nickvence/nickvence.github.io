.. title: laser-atom interaction
.. slug: laser-atom-interaction
.. date: 2021-01-04 12:34:35 UTC-05:00
.. tags: Science, Physics, 
.. category: Research
.. link: 
.. description: 
.. type: text
.. status: featured
.. has_math: true

.. image:: /files/ionization.jpg
    :width: 400
    :align: left


A LASER (Light Amplification by Stimulated Emition of Radiation) is generated when
a collection atoms are stimulated between two highly-reflected mirrors.
Photons (pieces of light) bounce back and forth further stimulating light into
a coherent (laser) beam.
Atoms are used to generate lasers, and lasers perturb the electrons surrounding atoms.
Atomic Molecular and Optical physicists study these interactions in depth to learn more
about nature, and to develop better lasers. 

During my graduate work I join two computational scientists at `Oak Ridge National Laboratory`_.
My science advisor, Predrag Krstic, was intrested in modeling quantum mechanical phenomena
in short-pulse interactions.  My computation advisor, Robert Harrision, was interested in
creating a framework to empower scientists to take advantage of High Performance Computing (HPC).
My research was based on this framework:  MADNESS_.

I wrote my thesis_ as a guide for those interested in strong laser-atom interactions.
In it I discus my project's motivation, a review of competing algorithms for non-perturbative,
laser-atom interactions, published results, and potential future directions one could take
the project.

My `Physical Review A`_ publication was a proof of concept which accomplished the following:

- performed convergence studies to ensure self-consistency,
- reproduced previously published results,
- replicated an experimental pulse,
- predicted an array of two-photon ionization effects,
- demonstrated the flexibility of our code by modeling a molecular hydrogen ion \\(H_2^+\\)
  that included the internuclear coordinate on the same computational footing as the electron.

.. youtube:: Az780-HFWys

.. _thesis: https://www.amazon.com/Laser-atom-interactions-multiresolution-Nicholas-Vence/dp/3639713575
.. _MADNESS: /madness.html
.. _`Oak Ridge National Laboratory`: https://www.ornl.gov/
.. _`Physical Review A`: /files/Vence01PRA.pdf
