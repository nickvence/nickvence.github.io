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
was designing a non-invaisve, proton, radiation treatment. 
I joined this project during the dose-finding portion of the study.
We used a rat to determine the radiation dose needed to scar cardiac tissue.
The treatment was to target the Sinoatrial node, the heart's spark plug,
with radiation.  Our hypothesis was that we could detect the development of scar
tissue in the Sinatrial node through an Electro-Cardiogram (ECG).

The animal procedure was :

1) sedating the rat,
2) giving the rat a CT-scan_ (3D x-ray),
3) planning two-beam proton radiation treatment,
4) administering proton radiation, and
5) monitoring the heart for signs of scarring. 

For the first step, `Ying Nie`_, our fearless biologist, placed the conscious rat in an
anesthesia box before comfortably securing the sedated rat in the half-pipe, anesthesia cradle that
would carry him for the duration of the experiment (see Fig. 1 upper).  

The second step was administering a chest CT-scan_ to our furry rodent; the resulting 3D image
gives our radiation specialist the information to create a two-beam, radiation, treatment plan.
For a succesful chest scan, the x-ray radiation must be gated (paused) during breathing to keep 
the exposure from bluring during chest movement.
On human subjects a box with reflective dots is placed on their chest and the CT-scanner 
registers its movement with a video feed. Unfortunately, this setup didn't work, for
rats are too small, their breathing amplitude is too shallow, and were pointing away from the camera.

Our solution was to use a pressure sensor to measure the rat's breathing and artifically
move the reflective box to interface with the CT scanner's existing video recognition system. 
The BIOPAC pressure sensor (Fig. 1 lower) output 10 Volt DC analog signal, and
I programmed an Arduino Uno to convert this to a `pulse width modulation`_ signal driving the
servo motor which moved the reflective box.  The first video gives an overview, and the second video
shows it in action. 

.. youtube:: CQWvdQLp8hk

.. youtube:: HKLfjAJJxnI

While the treatment plan (step three) was being created, I measured the spatial offset in the
gantry [#]_ using proton-sensitive film.  Then we performed step four: fixing the rat on the table,
dialing in the offset, and administering the proscribed radiation dose.

The final step took place over the following weeks as a cardiologist monitored the rat's ECG
for aberations that might be caused by scar tissue forming in the heart.

.. [#] Proton gantry is a large machine designed to move a proton beam around a patient receiving radiation therapy.

.. _`Cardiac arrhythmia`: https://en.wikipedia.org/wiki/Arrhythmia
.. _CT-scan: https://en.wikipedia.org/wiki/CT_scan
.. _`Ying Nie`: http://www.llu.edu/pages/faculty/directory/faculty.html?eid=1a34670
.. _`pulse width modulation`: https://en.wikipedia.org/wiki/Pulse-width_modulation
