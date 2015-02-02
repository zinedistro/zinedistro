# A Zine Distro in a Box

[![Build Status](https://travis-ci.org/zinedistro/zinedistro.svg?branch=master)](https://travis-ci.org/zinedistro/zinedistro)
[![Test Coverage](https://codeclimate.com/github/zinedistro/zinedistro/badges/coverage.svg)](https://codeclimate.com/github/zinedistro/zinedistro)
[![Code Climate](https://codeclimate.com/github/zinedistro/zinedistro/badges/gpa.svg)](https://codeclimate.com/github/zinedistro/zinedistro)
[![Dependency Status](https://gemnasium.com/zinedistro/zinedistro.svg)](https://gemnasium.com/zinedistro/zinedistro)

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

### What is it?

A Rails application to facilitate creating a [zine](https://en.wikipedia.org/wiki/Zine) distro. It includes a complete application to get started sharing zines online.

### Is It Good?

Yes.

### Is It "Production Ready™"?

Nope.

## Setup instructions

###  Using the Install Script

Run `bin/setup` should get everything you need up and running, including:

* Bundling gems
* Setting the `.env` file from the example file
* Database configuration
* Database setup and loading seed data

###  Using Vagrant

Install [Vagrant](http://www.vagrantup.com/downloads.html)

####Start the virtual machine:

```console
vagrant up
```

This command will download a virtual machine for Vagrant, install Docker on the virtual machine host, boot the Rails and PostgreSQL containers, link them together, set up the database, seed it with example data and finally, start the rails server.

It can take a while to download, so go find a nice zine to read in the meantime.

###Customize environment variables

See [.env.example](.env.example) for variables that need configuring. Copy `.env.example` to `.env` to get started:

```console
cp .env.example .env
```

Next up, add some randomized secrets for Devise and Rails. `DEVISE_SECRET_KEY`, and `SECRET_KEY_BASE` are secret keys for the app and should be different long, random strings. Try running `rake secret` and placing the output in the corresponding values of `DEVISE_SECRET_KEY` and `SECRET_KEY_BASE`. For example:

```console
echo "DEVISE_SECRET_KEY=`rake secret`" >> .env
echo "SECRET_KEY_BASE=`rake secret`" >> .env
```

For the values of `CARRIERWAVE_AWS_ACCESS_KEY_ID` and `CARRIERWAVE_AWS_SECRET_ACCESS_KEY`, you must enter your AWS credentials for an S3 bucket you wish to use to store PDFs and associated cover images.

For more information, see the [AWS page](http://docs.aws.amazon.com/AWSSecurityCredentials/1.0/AboutAWSCredentials.html) on security credentials.

If you wish to use another provider to store files, it should be possible, I just have not tried it yet. If you get it working or would like to ask a question, please open an [issue](./issues/new).

### User Setup

Once the application dependencies are taken care of, create your first user:

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
