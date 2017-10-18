// ======================================================================
// Data base connection to postgis image

var promise = require('bluebird');

var options = {
    // Initialization Options
    promiseLib: promise,
    // global event notification;
    error: function (error, e) {
        if (e.cn) {
            // A connection-related error;
            //
            // Connections are reported back with the password hashed,
            // for safe errors logging, without exposing passwords.
            console.log("CN:", e.cn);
            console.log("EVENT:", error.message || error);
        }
    }
};

var pgp = require('pg-promise')(options);

// ======================================================================


var fs = require('fs'),
        path = require('path');

var importTable = function(db,cb) {
    cb();
    
};

var createTable = function (db, cb, retry) {
    console.log("Dropping table osgb.opennames");
    db.none("DROP TABLE IF EXISTS osgb.opennames")
            .then(function (r) {
                console.log("Creating table osgb.opennames");
                db.none('CREATE TABLE osgb.opennames ('
                        + 'id NAME,'
                        + 'name1 NAME,'
                        + 'name2 NAME,'
                        + 'type NAME,'
                        + 'localtype NAME,'
                        + 'easting INTEGER,'
                        + 'northing INTEGER,'
                        + 'postcodedistrict NAME,'
                        + 'populatedplace NAME,'
                        + 'populatedplacetype NAME,'
                        + 'borough NAME,'
                        + 'county NAME,'
                        + 'region NAME,'
                        + 'country NAME'
                        + ')')
                        .then(function (result) {
                            importTable();
                        });
            });
};

exports.handler = function (event, context, callback) {

    var sem = require('semaphore')(1);
    sem.take(function () {

        var db = pgp({
            host: 'postgis',
            port: 5432,
            database: 'postgres',
            user: 'postgres'
                    //password: 'liar',
                    //ssl: true
        });

        console.log("Creating schema osgb");
        db.any('CREATE SCHEMA IF NOT EXISTS osgb')
                .then(function (result) {
                    createTable(db, sem.leave);
                })
                .catch(function (err) {
                    console.log(JSON.stringify(err));
                    sem.leave();
                });
    });

    context.callbackWaitsForEmptyEventLoop = false;
    sem.take(function () {
        callback();
        sem.leave();
    });

};
