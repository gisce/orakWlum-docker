# orakWlum-docker
Docker files for orakWlum!

## Build a new okW image

Use ```build_new_version.sh``` util to deploy new releases of the orakWlum!

```
$ ./build_new_version.sh <SERVICE> <TAG_BRANCH>
``` 
- ```$SERVICE``` can be "api" or "frontend"
- ```TAG_BRANCH``` is optional, and points to the TAG or BRANCH name
  - Default value is "master"


## Examples

### Building the last api version
```
$ ./build_new_version.sh api master 
``` 

### Building v0.8.0 of frontend
```
$ ./build_new_version.sh frontend v0.8.0 
``` 
