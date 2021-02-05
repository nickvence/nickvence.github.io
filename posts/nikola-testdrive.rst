.. title: Nikola testdrive
.. slug: nikola-testdrive
.. date: 2021-02-01 16:51:24 UTC-05:00
.. tags: nikola, reST, R
.. category: 
.. link: 
.. description: 
.. type: text
.. has_math:

Let's put reST through the paces -- to see how the features work.
I want to do the following:

* Insert picture
* Use math:  :math:`E=mc^2`
* Use hyperlink
* use cross-refference


Here COVID deaths vs time compared to previous mortality.

.. image:: /images/bar_chart.png

This data comes from the `CDC`_.
Here is what Einstein had to say,

.. include:: listings/bar_chart_COVID.R
	:code: R

.. note:: reST's **include** directive allows us to include a file.
	However, first make a symbolic link :code:`ln -s path/to/source.R`.

.. _CDC: http://data.cdc.gov/NCHS/Weekly-Counts-of-Death-by-State-and-Select-Causes/muzy-jte6

