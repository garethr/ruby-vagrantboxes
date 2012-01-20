## Introduction

This application extends the [vagrant](http://vagrantup.com) command line tool to allow for searching the [vagrantbox.es](http://vagrantbox.es) repository of base boxes.

## Usage

- List all currently available boxes: <pre>vagrant boxes search</pre>
- Do simple text searches: <pre>vagrant boxes search centos </pre>
- Do slightly more complex text searches: <pre>vagrant boxes search "debian puppet" </pre>
- Show all the details of a particular box: <pre>vagrant boxes show 1</pre>
- Show only the url of a particular box: <pre>vagrant boxes url 1</pre>
- Download a box listed on vagrantbox.es: <pre>vagrant boxes add 1</pre>

## Example

Here's a simple example of the output:

<pre>vagrant boxes search centos
3    centos 5.5                http://dl.dropbox.com/u/15307300/vagrant-0.7-centos-64-base.box
6    opscode centos 5          http://opscode-vagrant-boxes.s3.amazonaws.com/centos5-gems.box
7    opscode ubuntu 10.04      http://opscode-vagrant-boxes.s3.amazonaws.com/ubuntu10.04-gems.box
9    puppet centos 5.5 64      http://puppetlabs.s3.amazonaws.com/pub/centos5_64.box
10   puppet centos 4 64        http://puppetlabs.s3.amazonaws.com/pub/centos4_64.box
21   centos 5.6 32             http://yum.mnxsolutions.com/vagrant/centos_56_32.box</pre>

## Installation

The easiest way of installing is to use the gem.

<pre>gem install vagrantboxes</pre>
