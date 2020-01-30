# Hashtable

Hashtable is a project containing collections faster for big collections.

## Description

This is a replacement for (Identity)Dictionary and (Identity/Weak)Set that uses chaining instead of linear probing for collision resolution.
This results in a much better performance for big Collections.

## Installation

To install Hashtable on your Pharo image you can just execute the following script:

```Smalltalk
    Metacello new
    	githubUser: 'pharo-contributions' project: 'Hashtable' commitish: 'v1.x.x' path: 'src';
    	baseline: 'Hashtable';
    	load
```

To add Hashtable to your baseline just add this:

```Smalltalk
    spec
    	baseline: 'Hashtable'
    	with: [ spec repository: 'github://pharo-contributions/Hashtable:v1.x.x/src' ]
```

Note that you can replace the #v1.x.x by a branch as #master or #development or a tag as #v1.0.0, #v1.? or #v1.2.x.

## Version management 

This project use semantic versioning to define the releases. This means that each stable release of the project will be assigned a version number of the form `vX.Y.Z`. 

- **X** defines the major version number
- **Y** defines the minor version number 
- **Z** defines the patch version number

When a release contains only bug fixes, the patch number increases. When the release contains new features that are backward compatible, the minor version increases. When the release contains breaking changes, the major version increases. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

## Smalltalk versions compatibility

| Version 	| Compatible Pharo versions 	|
|-------------	|---------------------------	|
| 1.x.x       	| Pharo 61, 70, 80		|

## Contact

If you have any questions or problems do not hesitate to open an issue