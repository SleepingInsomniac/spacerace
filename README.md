#SpaceRace

[![Gem Version](https://badge.fury.io/rb/spacerace.svg)](https://badge.fury.io/rb/spacerace)

Replace spaces in source files

##Examples

####To replace tabs with two spaces:

```bash
spacerace filename -s $'\t' -r '  '
```

In bash you specify a literal tab with: `$'\t'`

####To replace two spaces with 1 tab:

```bash
spacerace filename -r $'\t' -s '  ' -d 2
```

The `-d` option reduces the existing space.