# my_tree

### You can diplay file and directories like tree command using bash and python scripts.

1) Rewrite python script path (absolute path)
py_script=/home/kksnd924/util/my_tree.py
  -> py_script="your location"

2) Execute sh script anywhere

```
# display the files in the current directory
$ my_tree.sh
```

```
# display the files in [dir]
$ my_tree.sh [dir]
```

```
# [depth] means max display depth of the directory tree
$ my_tree.sh [dir] [depth]
```