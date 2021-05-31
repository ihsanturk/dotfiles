# dotfiles

## install
MAKE SURE YOU HAVE BACKED UP your `~/.zshrc` and other config files, because
this will overwrite your existing configuration.
```
make
make pkgs
```

## uninstall
```
make uninstall
```

---

## show stranger file formats as text in macos quick look
(QLStephen)
find the type of the file format with
```
mdls -name kMDItemContentType <filepath>
```

add the output above and these to `LSItemContentTypes` array in
`~/Library/QuickLook/QLStephen.qlgenerator/Contents/Info.plist`
```
<string>public.unix-executable</string>
<string>dyn.ah62d4rv4ge8064p2</string>
```
and run
```
xattr -cr ~/Library/QuickLook/QLStephen.qlgenerator
qlmanage -r && qlmanage -r cache && pkill Finder && open /tmp
```
