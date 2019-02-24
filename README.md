# mallinfo

Tired of `gc` not clearing your memory in R when you have super large lists and super large environments?

## Installation

```r
devtools::install_github("Laurae2/mallinfo")
```

## Usage

Force garbage collection before trimming memory.

```r
gc(verbose = TRUE)
malloc.trim()
```
