# A Zine Distro in a Box

[![Build Status](https://travis-ci.org/zinedistro/zinedistro.svg?branch=master)](https://travis-ci.org/zinedistro/zinedistro)
[![Test Coverage](https://codeclimate.com/github/zinedistro/zinedistro/badges/coverage.svg)](https://codeclimate.com/github/zinedistro/zinedistro)
[![Code Climate](https://codeclimate.com/github/zinedistro/zinedistro/badges/gpa.svg)](https://codeclimate.com/github/zinedistro/zinedistro)
[![Dependency Status](https://gemnasium.com/zinedistro/zinedistro.svg)](https://gemnasium.com/zinedistro/zinedistro)
[![PullReview stats](https://www.pullreview.com/github/zinedistro/zinedistro/badges/master.svg?)](https://www.pullreview.com/github/zinedistro/zinedistro/reviews/master)

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

### What is it?

A Rails application to facilitate creating a [zine](https://en.wikipedia.org/wiki/Zine) distro. It includes a complete application to get started sharing zines online.

### Is it Good?

Yes.

### Is it "Production Ready™"?

Nope.

## Setup Instructions

###  Using the Install Script

Run `bin/setup` should get everything you need up and running, including:

* Bundling gems
* Setting the `.env` file from the example file
* Database configuration
* Database setup and loading seed data

###  Using Vagrant

Install [Vagrant](http://www.vagrantup.com/downloads.html)

####Start the Virtual Machine:

```console
vagrant up
```

This command will download a virtual machine for Vagrant, install Docker on the virtual machine host, boot the Rails and PostgreSQL containers, link them together, set up the database, seed it with example data and finally, start the rails server.

It can take a while to download, so go find a nice zine to read in the meantime.

###Customize Environment Variables

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


### Redis configuration

In order to optimize Redis for caching, change the key expiration policy to [`volatile-lru`](https://devcenter.heroku.com/articles/heroku-redis#maxmemory-policy):

```sh
heroku redis:maxmemory REDIS_URL --policy volatile-lru
```

Note that this is not necessary if the application was deployed using the `Deploy to Heroku` button

## Request for Contributions

We would be thrilled to have your input on the future of zinedistro. Let's get started with a few ground rules.

Please contribute to this repository if any of the following is true:
- You have expertise in community development, communication, or education
- You want open source communities to be more collaborative and inclusive
- You want to help lower the burden to first time contributors

## How to Contribute [![Stories in Ready](https://badge.waffle.io/zinedistro/zinedistro.svg?label=ready&title=Ready)](https://waffle.io/zinedistro/zinedistro)

Prerequisites: familiarity with [GitHub
PRs](https://help.github.com/articles/using-pull-requests) (pull requests) and
issues. Need help getting started? Try reading the [Github
guide](https://help.github.com/articles/using-pull-requests/).

When creating a pull request, we ask that you try to create a clear commit
message outlining what was changed, added or removed in the present tense. See
the [commit history](https://github.com/zinedistro/zinedistro/commits/master)
for examples of commit messages. For more information on the formatting of
commit messages, see Tim Pope's [blog
post](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)

In particular, this community seeks the following types of contributions:

- Ideas: participate in an
  [issues](https://github.com/zinedistro/zinedistro/issues) thread or start
  your own to have your voice heard.
- Improvements: help make this project more accessible to other users, make it
  more extensible and easier for a new user to launch their own zine distro.
- Outline sections: help us ensure that this repository is comprehensive. if
  there is a topic that is overlooked, please add it, even if it is just a stub
  in the form of a header and single sentence. Initially, most things fall into
  this category.
- Copy editing: fix typos, clarify language, and generally improve the quality
  of the content

#### Conduct

We are committed to providing a friendly, safe and welcoming environment for
all, regardless of gender, sexual orientation, disability, ethnicity, religion,
or similar personal characteristic.

Please be kind and courteous. There's no need to be mean or rude.
Respect that people have differences of opinion and that every design or
implementation choice carries a trade-off and numerous costs. There is seldom
a right answer, merely an optimal answer given a set of values and
circumstances.

Please keep unstructured critique to a minimum. If you have solid ideas you
want to experiment with, make a fork and see how it works.

We will exclude you from interaction if you insult, demean or harass anyone.
That is not welcome behaviour. We interpret the term "harassment" as
including the definition in the
[Citizen Code of Conduct](http://citizencodeofconduct.org/);
if you have any lack of clarity about what might be included in that concept,
please read their definition. In particular, we don't tolerate behavior that
excludes people in socially marginalized groups.

Private harassment is also unacceptable. No matter who you are, if you feel
you have been or are being harassed or made uncomfortable by a community
member, please contact one of the
[Zinedistro](https://github.com/zinedistro/zinedistro) core team immediately.
Whether you're a regular contributor or a newcomer, we care about making this
community a safe place for you and we've got your back.

Likewise any spamming, trolling, flaming, baiting or other attention-stealing
behaviour is not welcome.

# Communication

GitHub issues are the primary way for communicating about specific proposed
changes to this project. When making a contribution or commenting on someone
else's contribution, please follow the conduct guidelines above. Language
issues are often contentious and we'd like to keep discussion brief, civil and
focused on what we're actually doing, not wandering off into too much imaginary
stuff.

## License

[MIT licensed](https://tldrlegal.com/license/mit-license).

See [license](LICENSE.md) for more information.
