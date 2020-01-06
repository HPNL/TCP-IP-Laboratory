#!/bin/bash

for fig in Fig-*;
do
	[ -d $fig ] || continue
        cd $fig
        zip -r $fig.gns3p *
        mv $fig.gns3p ../
        cd ..
done

