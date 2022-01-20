Philipp Baumann
2022-01-20

# Interactive tests for OPUS binary imports with opusreader

## Scope and background

As per DESCRIPTION:

-   Package: opusreader

-   Title: Reading OPUS Binary Files in R

-   Description: A driver and associated functions for FTIR spectroscopy
    data recorded in the OPUS binary format, which is commonly used by
    Bruker FTIR spectrometers.

{opusreader} aims to contribute towards routine usage of spectroscopy —
“in production”, for various spectral estimation platforms. This is a
great motivation for strengthening the package with user feedback and
active collaboration.

Pierre Roudier approached me in April 2021 because he wanted to extract
the routines in `simplerspec::read_opus_bin_univ()` and its wrapper
`read_opus_univ()` , to create a “simple, small self-contained R package
called opusreader that is easier to maintain”. I agreed and since then,
we have pulled our forces together to work on {opusreader}.

{opusreader} has matured and we are happy to now provide

-   a relatively stable function interface, that will be extended with
    high affinity towards backwards compatibility.

-   zero dependencies apart from the base R ecosystem.

-   an improved documentation, for both the workhorse function
    `opus_read(),` handling file inputs, and its lower level
    implementation, `opus_read_raw()`, that digests streams of raw
    bytes.

-   point 4

The package is still maturing regarding the implemented parsing routines
and receives bug fixing, as far as our precious developer time allows.
In this spirit, future developments will harvest more robustly parsed,
relevant information from these files.

I can currently confirm that these snapshotted package versions and
commits are producing correctly parsed outputs:

-   current origin main x

-   fork main b

There have been a couple of earlier developments that have influenced
the creation of the improved {opusreader}. We owe our legacy to:

-   the [soil.spec](https://github.com/cran/soil.spec) R package by
    Andrew Sila, Tomislav Hengl and Thomas Terhoeven-Urselmans. It ships
    a basic reader, `read.opus()` (CRAN releases dating back to the
    period from 2010-06 to 2014-12; last version 2.1.4). The package is
    currently archived by CRAN but earlier CRAN releases can be
    downloaded from [here]().
-   A part of the algorithmic logic has been taken up by QED in form of
    the xxx. Providing a handy implementation in python…

I think we have come far, but as self-entitled open spectroscopy
community are not quite there yet. Let’s diagnose and further develop
Bruker OPUS binary imports with `opusreader::opus_read()`!

…

## Aims and ways forward

This repo contains, as the name suggests, interactive tests of past and
current functionality. It also looks into testing future innovations
(features), to further develop OPUS binary imports provided by
`opusreader::opus_read()`. We want to

1.  reproducibly test and compare reader versions among current and past
    development snapshots.
2.  scout for exact tests against the import via official closed source
    Bruker OPUS implementation.
3.  carefully cycle through spectral blocks and thereby check the
    expected data types and values when parsing individual measurement
    files. OPUS is a binary format. The current version is experimental
    because there is no complete, official documentation from *Bruker
    Optics GmbH*. In retrospect, the current approach often works but is
    leaky. It has lead to major issues (e.g. [issue 22](); more below).
    I have an optimistic outlook that we can eliminate most of them
    soon. We can borrow from clever tricks that were, as far as my
    skills using search engines go, first uncovered by twagner (Thomas
    Wagner; pseudonym hirschbeutel).
4.  have room for experimentation so that the package can become even
    more useful by adding extra productivity for spectroscopic
    communities.

To achieve stable releases, we should aim for

1.  every commit that introduces changes in the code being **reviewed by
    at least one person**. We have continuous integration; still,
    reverse engineering is a tight task and can easily introduce
    breaking changes because of incomplete knowledge and missing unit
    tests.

2.  a **minimal test suite of OPUS binary files** within **continous
    integration** that

    -   covers all significant **models** of Bruker fourier-transform
        infrared spectrometers.

    -   includes both the near infrared and mid infrared spectral ranges
        and their combination.

    -   are of major releases of the Bruker OPUS software suite that
        initiates the spectral measurements and writes the OPUS files.

    -   include variations in the **storage settings** in the OPUS
        example files prior to measurements. That means that our parser
        needs to handle all major spectral **block types**, general and
        sample specific **metadata** including relevant measurement
        settings and conditions (irrespective of the storage settings):

        -   list more…

3.  minimum necessary rules and stringent naming conventions for
    expected parsed outputs (main spectral elements and other data
    blocks). Both aspects need careful matching against spectroscopic
    theory and expected instrument/measurement behavior/routines.

## File specification

## Byte magic in the file header
