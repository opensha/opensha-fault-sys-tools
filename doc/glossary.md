# Glossary

Commonly used terms and definitions

### Fault Section

A fault section, usually defined with the OpenSHA [GeoJSON file format](https://opensha.org/Geospatial-File-Formats#fault-data). A fault section has, at a minimum, a unique ID number, a fault trace, dip, rake, and upper/lower seismogenic depths. Some large faults, e.g., the San Andreas Fault, may be broken down into a number of different fault sections (e.g., Coachella, Mojave, etc...).

### Fault Subsection

A small subset of a [fault section](#fault-section), usually with length approximately equal to half of the down-dip width of the fault.

### Fault Model

A collection of [fault sections](#fault-section] for a region.

### Rupture Set

A Rupture Set defines all of the on-fault [supra-seismogenic ruptures](#supra-seismogenic-rupture) in a fault system, and their properties (magnitude, rake, etc).

### Scaling Relationship

TODO

### Supra-Seismogenic Rupture

An earthquake rupture that ruptures the entire seismogenic width of the fault, usually with M&ge;6.5 (depending on the seismogenic width and [scaling relationships](#scaling-relationship) used). In a [Rupture Set](#rupture-set), this refers to a unique set of [fault subsections](#fault-subsection).
