
# SimpleRelay

  Uses different SMTP accounts based on the sender of the message

## Installation

Add this line to your application's Gemfile:

    gem install simple_relay

And then execute:

```shell
$ simple_relay configure
$ vim ~/.simple_relay.yml
$ simple_relay install
$ launchctl load ~/Library/LaunchAgents/com.github.vvlad.simple_relay.plist
$ lsof -p :1025
```

Configure your email client to use the relay server

