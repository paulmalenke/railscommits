# Rails Commits CLI

A command line app that allows you to see the latest commits from the Rails repository on GitHub

## Installation

Install through rubygems:

    $ gem install railscommits

## Usage

    $ railscommits --token TOKEN [--count N] [--author AUTHOR]
    
    -t, --token       GitHub OAUTH Token
    -c, --count       Optional count (number of results)
    -a, --author      Optional author (e.g. dhh)
    -h, --help        Display this help message.
