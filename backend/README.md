> Please check the [projects reame](../README.md) to see how to run frontend and backend.


The API calls are made using express.js and mssql library

## Run the Backend
when first starting the backend go to /backend and type 
npm install

To run the backend server go to /backend and type
node app.js


## Structure
In the folder "Routes" all the API calls to the DB are made

in the folder Routes the db is called and methods are initiated with the help of express.js. In app.js this methods are called and used. 

The db-SDK.js file in Frontend makes the API calls and defines the port. 

>Property
GET
http://localhost:3000/properties

/units

/rent/:id

/properties-units

/properties-details

POST
http://localhost:3000/properties

DELETE and GET id
http://localhost:3000/properties/id



>Owner
GET
http://localhost:3000/owners


POST
http://localhost:3000/owners

DELETE and GET id
http://localhost:3000/owners/id





>Tenant
GET
http://localhost:3000/tenants

POST
http://localhost:3000/tenants

DELETE and GET id
http://localhost:3000/tenants/id

> Services 

/service-charge-settlements`
/ScssOfLease/${id}

>Leases

/leases
/lease-units/${id}


