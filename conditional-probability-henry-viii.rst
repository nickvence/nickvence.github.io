.. title: Conditional Probability: Henry VIII
.. slug: conditional-probability-henry-viii
.. date: 2020-12-15 19:04:49 UTC-05:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
.. has_math: true


.. sidebar::  History 

    When Henry Tudor's brother died, Henry married his widow (**Catherine
    of Aragon**) to preserve the alliance with Spain. While Catherine produced a *daughter*
    (the future Bloody Mary), she did not produce a male heir - much to the constirnation
    of the king and his advisors.  In persuit of his "great matter" Henry VIII married
    six times. 

    First the beguiling **Anne of Bolyn** seduced the king, under her influence Henry broke
    with the Roman Catholic church starting the church of England.  She produced 
    the future Elizabeth I yet no *male* heir.

    One day after the execution of Anne, Henry got engaged with **Jane Seymour**, whom he
    married nine days later. She soon gave birth the future Edward VI, and died in childbirth. 

    Henry's next wife, **Anne of Cleves**, was a long-distance relationship that was chosen,
    in part for political reasons and partly because of an overly-flattering portrait.
    The union was short, Henry called her, "that flanders mare," and Anne later confirmed
    that the marriage was never consumated.

    Henry soon became enchanted with the young energetic **Catherine Howard**. However, two years
    later, when rumors of her involvement with other men were confirmed three more heads rolled.

    **Catherine Parr** was Henry's final wife. She helped him reconsile with his daughters Mary
    ane Elizabeth and nursed him to his death.

.. image:: http://www.gmtgames.com/nnhis/cover.jpg
    :align: left
    :width: 150
    :target: http://www.gmtgames.com

This article analyzes conditional probablilty in the context of the six-player, asymmetric
board game `Here I Stand`_ (HIS). Each player of HIS has a special way to earn victory points.
For instance, the English player gets 5 Victory Points (VP) upon produicing a male heir.
Since the first player to 25 VP wins, there is substantial incentive to secure the succession.

.. image:: /files/HenryVIII.png
    :align: left
    :width: 150
    :target: https://en.wikipedia.org/wiki/Henry_VIII

After playing his home card and persue a wife, the English player rolls a (six-sided) die
and consults the Henry's wives' pregnancy chart to see if any VP/children are born.
The English player might be interseted in the probability of acquiring a male heir
based on the number of rolls.  Mathematically, this is the cumulative probability distribution
and its calculation is the subject of this article.

HIS captures this drama, by awarding the English player special victory points based
on his progeny. Once per turn (HIS has only nine turns), the English player may play his
home card to roll a six-sided dice whose results are determined by the following table.

The probability of event A is written $P(A) = N_A/N_{total}$ where $N_A$ is the number of
outcomes where A is accomplished, and $N_{total}$ is the total events.  For example, if
event A is rolling a 3 on a pair of dice, then $N_A = 2$, $N_{total} = 36$, and $P(A) = 1/18$.

.. table:: **Table 0** Henry's Wives' Pregancy Chart

    +------+----------------------------------------------------------------------------+
    | Roll | Result                                                                     |
    +======+============================================================================+
    |  6+  | **Success** - **5 VP** Edward VI becomes Henry's healthy, long-lived heir. |
    |      | If Edward was born on a previous result of 5, this result                  |
    |      | indicates that  he regained his health.                                    |
    +------+----------------------------------------------------------------------------+
    |  5   | **Partial success** - **5 VP** a sickley boy is born though the blessed    |
    |      | queen dies soon after the birth. Add Mary I to the deck after Edward's     |
    |      | succession.  Add Edward I on Turn 6, and Mary I to the deck the first turn |
    |      | Edward rules.                                                              |
    +------+----------------------------------------------------------------------------+
    |  4   | **A baby is born** - **2 VP** but alas, it is a girl. Elizabeth I is added |
    |      | to the the on the first turn after Mary I becomes queen of England.        |
    +------+----------------------------------------------------------------------------+
    |  3   | Henry's flirtatious, young wife is found cavorting with other men. She is  |
    |      | sent to the Tower of London and beheaded. Advance the marital status maker |
    |      | and roll again for another wife.                                           |
    +------+----------------------------------------------------------------------------+
    |  2   | The queen is a loving step mother of Henry's children and a nurse to Henry.|
    +------+----------------------------------------------------------------------------+
    |  1   | After an arranged marriage, Henry is repulsed once he sees his wife.       |
    |      | the marriage is never consumated and divorces follows in 6 months.         |
    +------+----------------------------------------------------------------------------+


Roll 1
------

The event that Henry VIII was interested in was producing a male heir is satisfied by rolling
a five or six. On the first roll the probability of this happening is $2/6 = 0.33$. 

.. table:: **Table 1**  $P(A)$ is the probability of getting to Roll 1 is certain: you can't win before playing.  $P(B|A)$ is the probability of winning given we are at Roll 2.
    :align: right
    :class: float-right
    
    +---------------+------+--------+----------------+-------+
    | Roll 1        | P(A) | P(B|A) | P(B $\\cap$ A) | Win%  |
    +===============+======+========+================+=======+
    |      five six |  1   | 2/6    |   1/3          | 0.333 |
    +---------------+------+--------+----------------+-------+
    | Total                         |  1/3           | 0.333 |
    +---------------+------+--------+----------------+-------+

Roll 2
------

Roll 2 has two confounding details.
First, should a player roll a number a second time, he is awarded the next-highest number.
Second, Jane Seymour (the second queen) gets +1 added to her roll since she was the mother of Edward VI.
 
Were it not for Jane Seymore, there would be three ways to win on Roll 2:
 * roll 1-4 followed by a 6,
 * roll 1-4 followed by a 5, and
 * roll 4 followed by a 4.
However, thanks to +1 confirred by Jane Seymore the following paths all lead to a win:
 * roll 1-4 followed by a 6,
 * roll 1-4 followed by a 5,
 * roll 1-4 followed by a 4, and
 * roll 4 followed by a 3.

.. table:: **Table 2**  $P(A)$ is the probability of getting to Roll 2.  $P(B|A)$ is the probability of winning given we are at Roll 2.
    :align: right
    :class: float-right
    
    +---------------+---------+--------+---------------+-------+
    | Roll 2        | P(A)    | P(B|A) | P(B $\\cap$ A) | Win% |
    +===============+=========+========+===============+=======+
    | four five six | 1 - 2/6 | 3/6    | 12/36         | 0.333 |
    +---------------+---------+--------+---------------+-------+
    | three         | 1/6     | 1/6    |  1/36         | 0.028 |
    +---------------+---------+--------+---------------+-------+
    | Total                            | 13/36         | 0.361 |
    +---------------+---------+--------+---------------+-------+

To sum these probabilities it is easiest to think of the 36-element sample space of two dice.
Thus, the probability of winning on the second roll $P(2) = (4 + 4 + 4 + 1)/36 = 0.36$.
 
Roll 2 is an application of the conditional probality formalism,
which says the probability of event B given that event A has occured is
$$P(B|A) = \\frac{P(B \\cap A)}{P(A)}$$
where $P(A) > 0$, and $P(B|A)$ is read "the probability of B given A."
Rearranging yields
$$P(B \\cap A) = P(A) P(B|A).$$
To gain some intuition, let's apply this formalism to Roll 2.
The first term, $P(A)$ is the probability of *getting to Roll 2*; that is, not having won
on previous rolls: $P(A) = 1 - P(\\text{winning}) =1 - 2/6 = 0.67$.

The second term, $P(B|A)$ is the probability of winning *on Roll 2*. As outlined above,
this can happen four independent ways; each can be viewed as the probability of getting 
to Roll 2 times the probability of winning on Roll 2.

The coulumn $P(A)$ in each table is the probability of getting to this roll's win.

Roll 3
------

.. table:: **Table 3**  $P(A)$ is the probability of getting to Roll 3:.  $P(B|A)$ is the probability of winning given we are at Roll 2.
    :align: right
    :class: float-right
    
    +----------+-------------------+--------+---------------+-------+
    | Roll 3   | P(A)              | P(B|A) | P(B $\\cap$ A) | Win% |
    +==========+===================+========+===============+=======+
    | five six | 1 - (2/6 + 13/36) | 2/6    | 12/36         | 0.120 |
    +----------+-------------------+--------+---------------+-------+
    | four     | 2(1/6 * 1)        | 1/6    |  2/36         | 0.056 |
    +----------+-------------------+--------+---------------+-------+
    | three    | $(1/6)^2$         | 1/6    |  1/216        | 0.005 |
    +----------+-------------------+--------+---------------+-------+
    | Total                                 |               | 0.181 |
    +----------+-------------------+--------+---------------+-------+
 
Roll 3 gives us two creative oportunities to win: double fours and triple threes.
 * Roll 3 = 5-6
 * Roll 1 or 2 = 4 AND Roll 3 = 4
 * Roll 1 and 2 = 3 AND Roll 3 = 3 or 4

The $P(A)$ is the interesting column: the probability of qualifying for this win.
The value of $P(A)$ in the first row is the complement of winning Roll 2: $1 - P_2$. 
There are two ways of making double 4s: getting a 4 on Roll 1 OR a 3+1 on Roll 2.
The only way of getting triple threes is rolling: 3, 2+1, and 3.

Roll 4
------

.. table:: **Table 4** 
    :align: right
    :class: float-right

    +----------+-----------------------------+--------+---------------+-------+
    | Roll 4   | P(A)                        | P(B|A) | P(B $\\cap$ A) | Win% |
    +==========+=============================+========+===============+=======+
    | five six | 1 - (0.333 + 0.361 + 0.181) | 2/6    | 12/36         | 0.120 |
    +----------+-----------------------------+--------+---------------+-------+
    | four     | 3(1/6 * 1)                  | 1/6    |  2/36         | 0.056 |
    +----------+-----------------------------+--------+---------------+-------+
    | three    | $(1/6)^2$                   | 1/6    |  1/216        | 0.005 |
    +----------+-----------------------------+--------+---------------+-------+
    | two      | $(1/6)^2$                   | 1/6    |  1/216        | 0.005 |
    +----------+-----------------------------+--------+---------------+-------+
    | Total                                           |               | 0.181 |
    +----------+-----------------------------+--------+---------------+-------+
    
One can win Roll 4 the following ways:
 * Roll 4 = 5-6
 * Roll 1 or 2 or 3 = 4 AND Roll 4 = 4
 * All but one of the previous rolls were a 3 AND Roll 4 is a 3
 * Rolls 1-4 are 2s






.. _Here I Stand: https://www.gmtgames.com/p-508-here-i-stand-500th-anniversary-reprint-edition.aspx
