.. title: Radiosurgery
.. slug: radiosurgery
.. date: 2021-01-06 08:51:02 UTC-05:00
.. tags: Science, Physics, Medicine, Radiation
.. category: Research
.. link: 
.. description: 
.. type: text

Motivation
----------

.. figure:: /files/rat.png
    :alt: Rat in anesthesia cradle.  Pressure sensor.
    :align: right
    :figwidth: 350

    **Fig. 1** (Upper) Rat in anesthesia cradle. (Lower) Pressure sensor and
    Arduino-driven breath amplifier-box.

`Cardiac arrhythmia`_ is a deadly condition in which one's heart beat becomes
irregular and results in oxygen deprivation.  The current treatment for atrial
fibrilation (a type of cardiac arrhythmia) is cauterizing (burning) part of the
heart so that scar tissue will electrically isolate the tissue generating the spurious
electrical impulse.

Knowing that proton radiation kill cells and creates scar tissue, our research team
was designing a non-invaisve treatment using a proton beam.  In the dose finding study,
we used a rat model to test how much proton radiation was necessary to scar cardiac
tissue.

The animal procedure:

- sedating the rat,
- giving the rat a CT-scan_ (3D x-ray),
- planning two-beam treatment,
- administering proton radiation, and
- monitor the heart for signs of scarring. 

For the first step, `Ying Nie`_, our fearless biologist, placed the rat in an anesthesia
box before comfortably securing him in the half-pipe, anesthesia cradle that would carry
him for the duration of the experiment (see Fig. 1 upper).

The second step is to administer a chest CT-scan_ to our furry rodent; this enables the creation
of a two-beam radiation treatment plan.
For a succesful chest scan, the x-ray radiation must be gated (paused) during breathing to keep 
the exposure from bluring during chest movement.
On human subjects a box with reflective dots is placed on their chest and the CT-scanner 
registers its movement with a video feed. This set up would not work for our rats;
they are too small and hidden from the video camera.

Our solution was to measure the rat's breathing and artifically move the reflective box. 
The driving signal came from a BIOPAC pressure sensor with an analogue 10 Volt DC signal.
I used an Arduino to convert this to a `pulse width modulation`_ signal that drove the
servo motor which moved the box.  The first video gives an overview, and the second video
shows it in action. 

.. youtube:: CQWvdQLp8hk

.. youtube:: HKLfjAJJxnI

While the treatment plan was being created, I calibrated the movable proton gantry [#]_
with proton-sensitive film.  Then we fixed the rat on the table, dialed in the offset, 
and exposed the rat for the proscribed dose.

Afterwards the rats were returned to their cage and monitored for ECG abberations.

.. [#] Proton gantry is a movable proton beam.

.. _`Cardiac arrhythmia`: https://en.wikipedia.org/wiki/Arrhythmia
.. _CT-scan: https://en.wikipedia.org/wiki/CT_scan
.. _`Ying Nie`: http://www.llu.edu/pages/faculty/directory/faculty.html?eid=1a34670
.. _`pulse width modulation`: https://en.wikipedia.org/wiki/Pulse-width_modulation
