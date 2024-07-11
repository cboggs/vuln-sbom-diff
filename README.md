# Vuln SBOM diff - go build vs bazel build

This is a simple replication of the SBOM (Software Bill of Materials) issues we are facing when building using bazel

In this setup we are trying to build a simple go application with
- `UUID:1.6.0` package with checksum `h1:NIvaJDMOsjHA8n1jAhLSgzrAzy1Hgr+hNrb57e+94F0=`

Even though the package is simple, there are quiet a few differences

I have put the diff in [here](https://www.diffchecker.com/yNT6BwEJ/)

You can checkout the SBOMs generated by Syft in
- ./sbom-bazel-build.json
- ./sbom-go-build.json