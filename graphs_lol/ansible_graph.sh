#!/bin/bash

# LAYOUTS="dot neato twopi circo fdp osage patchwork sfdp"
LAYOUTS="dot neato fdp osage"

for LAYOUT in $LAYOUTS
do
    FILENAME="ansible_graph_$LAYOUT.png"

    echo -e "==> Generating graph $FILENAME"
    $LAYOUT -Tpng ansible_graph.dot -o $FILENAME
done
