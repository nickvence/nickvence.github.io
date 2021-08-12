.. title: Nikola testdrive
.. slug: nikola-testdrive
.. date: 2021-02-01 16:51:24 UTC-05:00
.. tags: nikola, reST, R
.. category: 
.. link: 
.. description: 
.. type: text
.. has_math: true

Let's put reST through the paces -- to see how the features work.
I want to do the following:

* **bold**, *italic*, ~~strikethrough~~ (not yet)
* Use math:  :math:`E=mc^2`
* Use hyperlink: `CDC`_.
* Use cross-refference Research_
* Insert picture
* Insert code from file
* Use directives


.. image:: /files/Example_Figure.png

.. include:: listings/Example_Figure.R
	:code: R

.. note:: The **image** directive *requires* the left-most
    :code:`/` in its path, while the **include** directive
    *can not have* the left-most :code:`/` in the path

.. note:: reST's **include** directive allows us to include a file.
	However, a link :code:`ln path/to/source.R` removes redundancy.

.. _Research: /research.html

.. _CDC: http://data.cdc.gov/NCHS/Weekly-Counts-of-Death-by-State-and-Select-Causes/muzy-jte6
