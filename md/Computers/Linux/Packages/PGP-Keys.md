# PGP Keys

## To search for key:

```sh
gpg --keyserver https://keyserver.ubuntu.com --search-keys {key}
```

## To retrieve key
```sh
gpg --keyserver keyserver.ubuntu.com --recv-key A88441BD4864F95BEE08E63A71EB474019940E11
```

## Skip key check (Not recommended first verify keys manually)
```sh
makepkg --skippgpcheck
```

## Skip key check yay (Not recommended first verify keys manually)
``` sh
yay -S foo --mflags "--skippgpcheck"
```