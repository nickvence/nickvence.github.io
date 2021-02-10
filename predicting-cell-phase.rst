.. title: Predicting Cell Phase
.. slug: predicting-cell-phase
.. date: 2021-01-04 17:09:34 UTC-05:00
.. tags: Science, Biology, Machine Learning, Support Vector Machine, Matlab, Database
.. category: Research
.. link: 
.. description: 
.. type: text

.. figure:: /files/celegans.jpg
    :align: center
    :alt: Confocal microscope of the c elegans worm

    The end of a  *c elegans* worm as seen by confocal microscope.
    The DNA of these stem cells has been stained red, and its
    shape can be used to predict the cell phase.
    The large green blob on the left is called the distal tip cell, which
    generates the stem cells that flow down the worm differentiating into
    their various roles. 

Stem cells are interesting because they can divide and specialize.
Control of stem cell development holds the promise of engineering new organs.
While the use of human stem cells in research is fraught with ethical complications,
`c elegans`_ worms are a small, translucent and have a short life span
which is why they are an ideal model for studing stem cells.
Confocal microscopes (along with DNA staining technology) enables the
creation of 3D images of stem cell DNA of these small worms.

An animal cell cycles through four stages of development: Growth (G1),
Synthesize new DNA (S), more growth (G2), and spliting or mitosis (M). 
Staining applies a compound which bonds a fluorecent molecule to a desired target.
It is possible to determine which cells are in a certain phase by
staining them; however, trying to stain for multiple cell phases causes complications.
**The goal**: use the shape of the DNA to classify the cell's phase.

The procedure:

- Stain cell DNA *and* one phase.
- Image worms in confocal microscope.
- Segment the image into individual cells.
- Run a variety of image processing filter on microscopy images to create a feature vector.
- Partition data into training set and validation set.
- Train support vector machine on training data.
- Determine accuracy on validation data.

I inhereted the above algorithm from a previous grad student who took a job in industry.
This project was a case study in poor programming practices:

- No code documentation
- Poor code-indentation
- Rampant redundancy
- Fragile code
- Poor choice of languages: using Matlab to manage an image database.
- Database key uniqueness issues

After some time with the project, I made some improvements:

- Created code repository
- Improved directory structure
- Factor code to reduce redundancy
- Reindex data to accomodate project growth
- Write README document for future users
- Improved prediction accuracy from 85% to 90%

.. _`C elegans`: https://en.wikipedia.org/wiki/Caenorhabditis_elegans
