Philipp Baumann
2022-01-19

# Interactive tests for OPUS binary imports with opusreader

The opusreader package has now a relatively stable function interface
still maturing. The key features are

1.  

There have been a couple of earler developments that have influenced the
creation of the improved {opusreader}. These are

-   The [soil.spec](https://github.com/cran/soil.spec) R package by
    Andrew Sila, Tomislav Hengl and Thomas Terhoeven-Urselmans. It ships
    a basic reader, `read.opus()` (CRAN releases dating back to 2010-06
    to 2014-12; last version 2.1.4). The package is currently orphaned
    by CRAN, but [its CRAN archive]() provides legacy.

Let’s diagnose and further develop Bruker OPUS binary imports with
`opusreader::read_opus()`. We have come far, but we as self-entitled
open spectroscopy community are not quite there yet.

Current state

## Aims and way forward

This repo contains, as the name suggests, interactive tests and
innovations to further develop OPUS binary imports provided by
`opusreader::read_opus()`. We want to

1.  test and compare reader versions among current development
    snapshots.
2.  scout for exact tests against the import via official closed source
    Bruker OPUS implementation.
3.  carefully cycle through spectral blocks, their expected data types
    and values when parsing individual measurement files. OPUS is a
    binary format, and the current version is experimental because there
    is no complete, official documentation from *Bruker Optics GmbH*. In
    retrospect, the current approach often works but is leaky. It has
    lead to major issues (e.g. [issue 22](); more below). We can borrow
    from clever tricks that were first uncovered by twagner.

To achieve stable releases, we should aim for

-   every commit that introduces changes in the code being **reviewed by
    at least one person**. We have continuous integration; still,
    reverse engineering is a tight task and can easily introduce
    breaking changes because of incomplete knowledge and missing unit
    tests.

-   a **minimal test suite of OPUS binary files** within **continous
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

        -   

-   minimum necessary rules for expected parsed outputs that are
    carefully matching against

-   provinding stringent naming conventions for spectral elements
    together with matching.
