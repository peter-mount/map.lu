Import the Ordnance Survey Open Names data set into a postgis database


Create the database:

docker run -d --name postgis area51/postgis

Then to import the data set:

# Location of the expanded Open Names data set zip archive.
DATA=/home/peter/tmp/osnm

docker run -it --rm \
    --link postgis \
    -v $DATA/DATA:/var/task/DATA \
    -v $(pwd):/var/task \
    lambci/lambda
