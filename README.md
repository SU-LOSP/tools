
This library parses the TEI-encoded Shakespeare plays published by the Folger
Shakespeare Library. It also demonstrates different use cases for stage data by
providing some example applications.

You can download individual plays [here][downloads] and the complete set
[here][download-all].

[downloads]: http://www.folgerdigitaltexts.org/download/
[download-all]: http://www.folgerdigitaltexts.org/download/xml/FolgerDigitalTexts_XML_Complete.zip

The toolset can be installed using cabal or stack:

    cabal install folgerhs
    stack install folgerhs

Once installed, it can be used as a library (documentation needs yet to be
written) or as an application.

## Stage animation

The current speaker is surrounded by a white border, arrows going up represent
characters leaving the stage, arrows going down represent characters entering
it. The animation can be stopped using the `space` bar, you can advance it by
using the `right` arrow and rewind it using the `left` one.

    $ folgerhs animate TN.xml

![Part of Twelfth Night](./video.gif)

## Per-line character presence

With characters as columns and lines as rows, a line-by-line breakdown of
speakers and characters on stage.

    $ folgerhs presence R2.xml --without-unnamed | head -n 2
    Act.Scene.Line,RichardII,Gaunt,HenryIV,Mowbray,DuchessOfGloucester,LordMarshal,Aumerle,Green,Bagot,Bushy,York,Queen,Ross,Willoughby,Northumberland,Hotspur,Berkeley,Salisbury,WelshCaptain,BishopOfCarlisle,Scroop,Gardener,Fitzwater,Surrey,AbbotOfWestminster,DuchessOfYork,Exton,Groom,Jailer
    1.1.1,Speaker,Present,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent,Absent

## Per-character speech ratio

    $ folgerhs speakers Rom.xml | head -n 5
    19.38%   Romeo
    14.03%   Juliet
    10.70%   Nurse
    7.49%    Benvolio
    7.37%    Mercutio
