#! /bin/bash

mongoimport -d test_db -c roles --jsonArray  --file /mongo-seed/roles.json
mongoimport -d test_db -c users --jsonArray  --file /mongo-seed/users.json
mongoimport  -d test_db -c user_token --jsonArray  --file /mongo-seed/user_token.json
mongoimport  -d test_db -c propreties --jsonArray  --file /mongo-seed/propreties.json
mongoimport -d test_db -c contracts --jsonArray  --file /mongo-seed/contracts.json
mongoimport  -d test_db -c complaints --jsonArray  --file /mongo-seed/complaints.json
