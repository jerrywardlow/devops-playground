db = db.getSiblingDB('nodedb');
db.createUser( {
    user : "nodeuser",
    pwd : "password",
    roles : [
        {
            role : "readWrite",
            db : "nodedb"
        },
        {
            role : "clusterMonitor",
            db : "admin"
        }
    ]
} );
