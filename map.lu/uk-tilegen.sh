#!/bin/bash
#======================================================================
# Shell script to generate the tiles for the UK from a base tile set
#
# Version 1:    Generate the tiles for the uk
#======================================================================

layer=osgb2015/full
genz=$1

z=5;
ix1=15
ix2=16
iy1=20
iy2=22

z=5;
x1=$ix1
x2=$ix2
y1=$iy1
y2=$iy2

echo "Zoom	X1	X2	Y1	Y2	Tiles"
echo "==============================================="
while [ $z -lt 17 ]
do
    n=$(echo "($x2-$x1+1)*($y2-$y1+1)"|bc);
    echo "$z	$x1	$x2	$y1	$y2	$n"
    x1=$(($x1*2))
    x2=$((($x2+1)*2-1))
    y1=$(($y1*2))
    y2=$((($y2+1)*2-1))
    z=$(($z+1))
done

z=5;
x1=$ix1
x2=$ix2
y1=$iy1
y2=$iy2
while [ $z -lt $genz ]
do
    x1=$(($x1*2))
    x2=$((($x2+1)*2))
    y1=$(($y1*2))
    y2=$(((($y2+1)*2)))
    z=$(($z+1))
done
n=$(echo "($x2-$x1+1)*($y2-$y1+1)"|bc);
echo
echo "Geneting $genz"
echo "$z	$x1	$x2	$y1	$y2	$n"

c=0

x=$x1
while [ $x -le $x2 ]
do
    d=tiles/$layer/$z/$x
    mkdir -pv $d

    y=$y1
    while [ $y -le $y2 ]
    do
	pc=$((echo scale=3;echo "${c}*100/$n")|bc)
        echo "Tile $x $y $pc $c/$n"
	c=$(($c+1))
        if [ -f temp.png ]
        then
            rm -f temp.png
        fi
        curl -s -o temp.png "http://ganymede.area51.onl:8080/geoserver/gwc/service/tms/1.0.0/osgb15full@EPSG:900913@png/$z/$x/$y.png"
        if [ -f temp.png ]
        then
            md5=$(md5sum temp.png|cut -f1 -d' ');
            if [ "$md5" != "b434acaf3ee2ffc0e5dd9fd603112124" ]
            then
                if [ "$md5" != "29e79cc2e4fe182660936eb2ff1f5aab" ]
                then
                    mv temp.png $d/${y}.png
                fi
            fi
        fi

        y=$(($y+1))
    done

    x=$(($x+1))
done
