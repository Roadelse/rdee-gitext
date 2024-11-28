# features

+ (?) Optimize retrievement for `PS1_orig` in `iG/iGn` & `qG`, i.e., resolve it dynamically rather than using the previsouly stored one since it may changed via conda or anything else

***
+ (2024-11-28) Add pre-commit hook, supporting auto-version now
+ (2024-11-27) Add "label add" command & label info display in "config show"
+ (2024-11-26) For `gits pull`, show information implying which repo actually pulls something
+ (2024-11-10) show colorful commit id in "gits status"
+ (2024-11-10) add message of n\_threads & time cost for `gits status`
+ (2024-11-09) fix bug for wrong PS1 length computation, i.e., too short now
+ (2024-11-01) add an arg of iG, if it is set to nostat, the prompt will not represent status

***


+ (x) OPTIMIZE: add cache for git repository status, via checking .git/index mtime
    + Modifying files doesn't change mtime of .git/index!
