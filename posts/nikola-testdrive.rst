.. title: Nikola testdrive
.. slug: nikola-testdrive
.. date: 2021-02-01 16:51:24 UTC-05:00
.. tags: nikola, reST, R, ICD death-codes
.. category: 
.. link: 
.. description: 
.. type: text
.. has_math: true

Let's put reST through the paces -- to see how the features work.
I want to do the following:

* **bold**, *italic*
* Use math:  :math:`E=mc^2`
* Use hyperlink: `CDC`_.
* Use cross-refference Research_
* Insert picture


Monthly COVID are compared to previous year's mortality;
the `CDC`_ data was taken mid-November, 2020.

.. image:: /files/bar_chart.png

.. include:: listings/bar_chart_COVID.R
	:code: R

.. attention:: The **image** directive *requires* the left-most
    :code:`/` in its path, while the **include** directive
    *can not have* the left-most :code:`/` in the path

.. note:: reST's **include** directive allows us to include a file.
	However, first make a symbolic link :code:`ln -s path/to/source.R`.

.. _CDC: http://data.cdc.gov/NCHS/Weekly-Counts-of-Death-by-State-and-Select-Causes/muzy-jte6
.. _Research: /research.html
