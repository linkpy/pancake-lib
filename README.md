# Pancake Library

General purpose library.


## Installation

[PPM](https://github.com/linkpy/pancake-pm) :

```lua

-- Add this to you package's build.nelua file :
## ppm.package('linkpy/pancake-lib')

```


## Content

### `plib.meta` : Metaprogramming utilites 

 - `plib.meta.unit_test` : Simple unit testing macros.
 - `plib.meta.concepts` : Generic concepts.

### `plib.core` : Core and simple types

 - `plib.core.cll` : 'C Low Level', low level utilities.
 - `plib.core.sumtype` : Sumtype (tagged unions) implementation.
 - `plib.core.option` : `option(T)` type, used to denote optional types.
 - `plib.core.result` : `result(T, E)` type, used to denote possible errors (NYI).
