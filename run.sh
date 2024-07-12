#!/bin/bash

iter=two
go=gobuild
bz=bazel

mkdir -p ${iter}

docker build -f raw-build.Dockerfile   --load -t ${go}:${iter} .
docker build -f bazel-build.Dockerfile --load -t ${bz}:${iter} .

echo "## TRIVY SBOM GEN"
trivy image --format cyclonedx --output ${iter}/${go}.trivy.json ${go}:${iter}
trivy image --format cyclonedx --output ${iter}/${bz}.trivy.json ${bz}:${iter}

echo "## TRIVY VULN SCAN"
trivy image -f table ${go}:${iter} > ${iter}/${go}.trivy-scan.txt
trivy image -f table ${bz}:${iter} > ${iter}/${bz}.trivy-scan.txt

echo "## SYFT SBOM GEN"
syft ${go}:${iter} -o json | jq > ${iter}/${go}.syft.json
syft ${bz}:${iter} -o json | jq > ${iter}/${bz}.syft.json
