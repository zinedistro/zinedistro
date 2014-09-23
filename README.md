# A Zine Distro in a Box

[![Build Status](https://travis-ci.org/zinedistro/zinedistro.svg?branch=master)](https://travis-ci.org/zinedistro/zinedistro)
[![Coverage Status](https://img.shields.io/coveralls/zinedistro/zinedistro.svg)](https://coveralls.io/r/zinedistro/zinedistro)
[![Code Climate](https://codeclimate.com/github/zinedistro/zinedistro/badges/gpa.svg)](https://codeclimate.com/github/zinedistro/zinedistro)
[![Dependency Status](https://gemnasium.com/zinedistro/zinedistro.svg)](https://gemnasium.com/zinedistro/zinedistro)

### What is it?

A Rails application to facilitate creating a [zine](https://en.wikipedia.org/wiki/Zine) distro. It includes a complete application to get started sharing zines online.

### Is It Good?

Yes.

### Is It "Production Ready™"?

Nope.

## Setup instructions

1. Install [Vagrant](http://www.vagrantup.com/downloads.html)

2. Start the virtual machine:

```console
vagrant up
```

This command will download a virtual machine for Vagrant, install Docker on the virtual machine host, boot the Rails and PostgreSQL containers, link them together, set up the database, seed it with example data and finally, start the rails server.

It can take a while to download, so go find a nice zine to read in the meantime.

Once that has completed, create your first user:

```console
vagrant ssh
cd /home/app/zinedistro
./bin/console
```

In the Rails console that appears, type something similar to this while substituting your own email address and password:

```ruby
User.create!(email: 'admin@example.com',
             password: 'password',
             password_confirmation: 'password')
```

## Contributing

Coming soon. Currently, Zinedistro is not ready for contributions. If you have a question or or an idea, please file an issue.

## License

[MIT licensed](https://tldrlegal.com/license/mit-license).

See [license](LICENSE.md) for more information.
