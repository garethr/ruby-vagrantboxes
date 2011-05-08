## Introduction

This application extends the [vagrant](http://vagrantup.com) command line tool to allow for searching the [vagrantbox.es](http://vagrantbox.es) repository of base boxes.

## Usage:

- List all currently available boxes: <pre>vagrant vagrantboxes search</pre>
- Do simple text searches: <pre>vagrant vagrantboxes search centos </pre>
- Do slightly more complex text searches: <pre>vagrant vagrantboxes search "debian puppet" </pre>
- Show all the details of a particular box: <pre>vagrant vagrantboxes show 1</pre>
- Show only the url of a particular box: <pre>vagrant vagrantboxes url 1</pre>
- Download a box listed on vagrantbox.es: <pre>vagrant vagrantboxes add 1</pre>

## Installation

<pre>gem install vagrantboxes</pre>
