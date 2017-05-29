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


## Change the active okW image!

Use ```change_version.sh``` util to activate a different TAG of an existing service image

```
$ ./change_version.sh <SERVICE> <TAG>
``` 
- ```$SERVICE``` can be "api" or "frontend"
- ```TAG``` points to the existing image TAG


## Examples

### Building the last api version and activating it
```
$ ./build_new_version.sh api master 

$ ./change_version.sh api master 
``` 

### Building v0.8.0 of frontend
```
$ ./build_new_version.sh frontend v0.8.0 

$ ./change_version.sh frontend v0.8.0 
``` 
