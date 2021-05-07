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


A LASER (Light Amplification by Stimulated Emition of Radiation) is generated when
a collection atoms are stimulated between two highly-reflected mirrors.
Photons (pieces of light) bounce back and forth further stimulating light into
a coherent (laser) beam.

.. youtube:: R_QOWbkc7UI
    :align: right

.. image:: /files/ionization.jpg
    :width: 400
    :align: right

Atoms are used to generate lasers, and lasers perturb the electrons surrounding atoms.
Atomic Molecular and Optical physicists study these interactions in depth to learn more
about nature, and to develop better lasers. 

During my graduate work I joined two computational scientists at `Oak Ridge National Laboratory`_.
My science advisor, Predrag Krstic, was intrested in modeling quantum mechanical phenomena
in short-pulse interactions.  My computation advisor, Robert Harrision, was interested in
creating a framework to empower scientists to take advantage of High Performance Computing (HPC).
Together they helped me create a computational experiment simulating how single-electron atoms
(Hydrogen, $He^+$, $Li^{2+}$) responded to a strong, short laser pulse.  This research was
built on Robert Harrison's MADNESS_ framework. Sometimes it was exciting to develop world-class;
other times it was frustrating pausing science to improve the tool.

I wrote my thesis_ as a guide for those interested in computing strong laser-atom interactions.
In it I discus my project's motivation, review of competing algorithms for non-perturbative,
laser-atom interactions, published my results, and outlined the potential future directions
one could take this project.

My `Physical Review A`_ publication was a proof of concept which accomplished the following:

- performed convergence studies to ensure self-consistency,
- reproduced previously published results,
- replicated an experimental pulse,
- predicted an array of two-photon ionization effects,
- demonstrated the flexibility of our code by modeling a 4D molecular hydrogen ion $H_2^+$
  where we treated the internuclear coordinate on the same computational footing as the electron.

.. youtube:: Az780-HFWys

.. _thesis: https://www.amazon.com/Laser-atom-interactions-multiresolution-Nicholas-Vence/dp/3639713575
.. _MADNESS: /madness.html
.. _`Oak Ridge National Laboratory`: https://www.ornl.gov/
.. _`Physical Review A`: /files/Vence01PRA.pdf
