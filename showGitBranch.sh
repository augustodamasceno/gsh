#!/bin/bash
# Show git branch on

echo $( git branch | grep \* | tail -c $(wc -c $(git branch | grep \*)) )

#PS1=$PSI%showGitBranch
