# Hashtable
Temporary fork of Moose's Hashtable

## Description

This is a replacement for (Identity)Dictionary and (Identity/Weak)Set that uses chaining instead of linear probing for collision resolution.
This results in a much better performance for big Collections.

## Installation

To install Hashtable on your Pharo image you can just execute the following script:

```Smalltalk
    Metacello new
    	githubUser: 'jecisc' project: 'Hashtable' commitish: 'v1.x.x' path: 'src';
    	baseline: 'Hashtable';
    	onWarningLog;
    	load
```

To add Hashtable to your baseline just add this:

```Smalltalk
    spec
    	baseline: 'Hashtable'
    	with: [ spec repository: 'github://jecisc/Hashtable:v1.x.x/src' ]
```

Note that you can replace the #v1.x.x by a branch as #master or #development or a tag as #v1.0.0, #v1.? or #v1.2.x.