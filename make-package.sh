#!/bin/bash

make generate

cat package/crossplane.yaml > _output/package.yaml

for crd in $(ls package/crds); do
  echo "---" >> _output/package.yaml
  cat "./package/crds/${crd}" >> _output/package.yaml
done

make build
