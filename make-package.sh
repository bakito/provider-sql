#!/bin/bash

make generate

cat package/crossplane.yaml > _output/package.yaml

for crd in $(ls package/crds); do
  echo "---" >> _output/package.yaml
  cat "./package/crds/${crd}" >> _output/package.yaml
done

make build


# SELECT pr.name,s.name AS "SCHEMA" ,pe.class_desc
#   	FROM sys.database_principals AS pr
#   	JOIN sys.database_permissions AS pe
#   	    ON pe.grantee_principal_id = pr.principal_id
#   	LEFT JOIN sys.schemas s ON s.schema_id = pe.major_id
#   	WHERE
#   	  pr.name = 'sql-example-user';