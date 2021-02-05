.. title: Proton Computed Tomography
.. slug: proton-computed-tomography
.. date: 2021-01-08 11:00:40 UTC-05:00
.. tags: Science, Physics, 
.. category: Research
.. link: 
.. description: 
.. type: text

Motivation
----------

.. figure:: /images/bragg.png
    :width: 400
    :align: right
    :alt: Comparing radiation-depth profiles: protons, x-rays, carbon
    :figwidth: 450

    **Fig. 1** Radiation depth profile.
    X-rays decay exponentially decay with depth.
    Protons deposit the least energy up entry,
    and deposit the most just before stopping at the Bragg Peak.
    Carbon ions have a sharper Bragg peak, but exhibit an 
    undesired trail of radiation beyond the peak.
    
.. class:: lead

Cancer is the second leading cause of death in the Western world.
While surgery and chemotherapy can cure patients, these treatments
are often augmented with radiation.

Radiation onocologists have several radiation modalities to choose from.
X-rays, being the easy to produce, are more economical than other modalities.
Their radiation penetration profile is exponential with depth (see Fig. 1);
that is, they deliver most of their radiation near the surface.
Thus, phycicians must spread out the deilvery of the radiation
if the tumor is to receive the largest dose.

Protons deliver the most tissue damage just before they stop; this is
called the Bragg peak (see Fig. 1).
The Bragg peak makes proton radiation a desirable tool in planning treatments
of head and neck tumors which are often surrounded by vital organs. 
For these patients, the ability to minimize the
treatment volume is often the difference between treatment and
no treatment: the difference between life and death.

Proton Computed Tomography (pCT) will offer two unique advantages to 
patients getting treated with proton radiation.
First, the radiation dose from pCT is lower than that of
x-ray Computed Tomography (xCT).

Second, radiation treatment planning requires a 3D image of the tumor,
and currently xCT is currently the only option.
This is unfortunate because x-rays and protons stop differently; that is
an xCT returns a map of x-ray absorbtion. While this map is useful
(it displays the tumor's location relative to anatomical landmarks)
it is ambiguous; that is, for a variety of tissues, there is not a
one-to-one mapping between the stopping power of protons and x-rays.

This stoping power uncertainty gives physicians two unsavory choices: over-radiating and
under-radiating. For tumors far from vital organs, over-radiating causes 
extra collageral damage: unfortunate, but acceptable.  For tumors near 
vital organs, over-radiating could cause blindness, paralysis, or death.

The dangers of under radiation are simple. The patient's treatment must
be prolonged to make up for a low-dose.  However, if the tumor is unsufficiently
irradiated it will relapse -- negating the radiation therapy.
This is almost as bad as death: a large expense without cure.

To avoid relapse, doctors apply a margin of error around the tumor to 
be sure undetected tumor tenticles are destroyed. For tumors far
from vital organs, this acceptable; the body will
recover from the radiation damage. However, tumors in the head
and neck are often located too close to vital organ; that is,
there is no room for doctors to prescribe the appropriate radiation 
margin.  Unfortunately, these patients are denied treatment.

By eliminating the differential stopping power between xCT and pCT, 
phycisians will be able to perscribe smaller tumor margins. This means
all patients will receive lower radiation dose, and
fewer patients will be denied treatment.


The Scanner
-----------

.. figure:: /images/pct3.png
    :width: 400
    :align: right
    :alt: The proton Computed Tomography scanner.
    :figwidth: 400

    **Fig. 2** (Upper) Photo of the proton Computed Tomography scanner.
    (Lower) A representative proton path traveling through the forward position detector,
    through a head-phantom, through the rear position detector, and into the energy detector.

.. figure:: /images/callibration.png
    :width: 400
    :align: right
    :alt: Calibration phantom
    :figwidth: 400

    **Fig. 3** The numbered scintillating energy detectors (yellow).
    The calibration phantom (orange) is also shown in the inset.

The pCT scanner consists of two parts:
the proton tracker and the proton energy detector.

The tracker is a silicon strip detector (SSD) charged with a moderate voltage.
When hit by a proton, scattered electrons flow down the strips to register the coordinate.
A position measurement requires a SSD for the x and y coordinate,
and two positions are needed to record the angle.
Thus, to measure the incoming and outgoing angle, the proton must pass through eithg SSD detectors.

As the proton breaks to a stop, the scintillating energy detector gives off light.
The proton stops in a series of five Cesium-Iodide (CsI) crystals.
Each are wrapped in reflective tape and connected to photomultiplier tubes whose signal
is processed to determine the proton's energy.

Energy Callibration
-------------------
I worked with the callibration of the energy detector 
which involved the following steps:

- Create low-intensity proton beam.
- Take data with calibration phantom (Fig. 3).
- Reconstruct proton path from tracker data.
- Determine the distance traveled in the calibration phantom.
- Correlate this distance to light output.

For calibration, we must create an environment measruing single proton events; 
thus we need a low-intensity beam. There will always be a probability of multi-proton
events, but so long as the statistics are sufficiently low, their effect will be minimal [#]_ .

The calibration phantom shown in Fig. 3 was designed to take a batch
uniform-energy protons and spread their energies in a manner that may be predicted 
by their path. 
A stepped triangular prism provides an surface on which tracker error will not greatly 
affect path length.
The tracker phantom has four removable blocks which allow us to create protons across
the range of usable energies. The orange drawing shows the calibration phantom with all 
the blocks present, and the inset photo shows the calibration phantom with the blocks
removed.

Proton data came in the form of eight coordinants (from the SSDs) and five floating point
values for the light output of the five energy detectors.
First, tracker data was transformed from SSD strip number into detector coordinates.
While the incoming and outgoing angle gave us geometric rays which were often not colinear due
to proton scattering, it was easiest to disguard these high angle events. 
Given to nearly-colinear rays, reconstructing the path was reduced to an
advanced high school algebra problem.

The position of the callibration was fixed with steel pins to make the next step reproducible:
determining the total stopping power encountered by the proton.  The stoping power traversed
is characterized by the Water Equivalent Path Length (WEPL); this provides a standard unit.
The next step was to transform a given geometric path, first into the path-length inside
the callibration phantom, and second into a WEPL.  This invovled determining the
intersection of the path with the intricate triangular step prism.

Because a proton deposits the maximum energy just before stopping (the Bragg peak),
we gain maximize the precision of our energy measurement by
calibrating using the light from the deepest crystal that contains the Bragg peak

pCT scanners
------------

Reinhard Schulte, our project's principle investigator, created the phase 0 scanner
to include in his R01 grant application; it was made from spare parts and was added to imporve 
the chances of his grant success. It worked; this proof of concept convinced
the grant comittee of the project's viability .

Much more care and engineering went into the design of the phase 1 scanner.
However, data acquisition was one of its bottle necks, and scans took between five and six hours.
One can imagine how difficult this ordeal would be for a human receiving such a scan.

Amoung the many improvements in the phase 2 scanner was a series of custom designed 
integrated circuits to process current bursts from individual proton events on a single chip.
This allowed us to take data at about 1 MHz which reduced the total scan time to between
five and ten minutes.

Pulbications
------------
- `Track Reconstruction with the Silicon Strip Tracker of the Proton CT Phase 2 Scanner`_
- `First experimental results`_
- `Design and performance of a preclinical proton CT head scanner`_


.. [#] It is possible to remove some of these events through data cleaning.
.. _`Track Reconstruction with the Silicon Strip Tracker of the Proton CT Phase 2 Scanner`: /files/Vence03.pdf
.. _`First experimental results`: https://www.redjournal.org/article/S0360-3016(15)00966-9/abstract
.. _`Design and performance of a preclinical proton CT head scanner`: https://www.thegreenjournal.com/article/S0167-8140(15)40407-4/pdf
