# Campaign Monitor - Smart Transactional Emails for Rails

[![Code Climate](https://codeclimate.com/github/madetech/createsend-rails/badges/gpa.svg)](https://codeclimate.com/github/madetech/createsend-rails)

[![Build Status](https://travis-ci.org/madetech/createsend-rails.svg?branch=master)](https://travis-ci.org/madetech/createsend-rails)

[![Test Coverage](https://codeclimate.com/github/madetech/createsend-rails/badges/coverage.svg)](https://codeclimate.com/github/madetech/createsend-rails/coverage)


The `create_send_rails` Gem drops into ActionMailer and sends transactional emails via the [Campaign Monitor API](https://www.campaignmonitor.com/api/), using its [Smart Email](https://www.campaignmonitor.com/api/transactional/#send_a_smart_email) feature. 

It updates ActionMailer so it defaults to JSON mailer views and allows you to define the data required for each of your mailers.

## Getting Started

To get started, add the following line to your applications `Gemfile`:

```ruby
gem 'createsend-rails'
```
Then update your environment files and set `delivery_method` to `create_send` and include your CampaignMonitor `api_key` within the settings block.

```ruby
config.action_mailer.delivery_method = :create_send
config.action_mailer.create_send_settings = {
    api_key: 'INSERT_API_KEY'
}
```
Now go into your `views/*_mailer/` and add a `.json` view, which defines the data attributes required by your Smart Email template. Below is an example of a password reset email.  

```json
{
    "smart_email_id": "SMART_EMAIL_ID",
    "language": "<%= @user.language %>",
    "name": "<%= @user.name %>",
    "reset_url": "<%= @edit_password_reset_url %>"
}
```

## Credits

![made](https://s3-eu-west-1.amazonaws.com/made-assets/googleapps/google-apps.png)

Developed and maintained by [Made Tech Ltd](https://www.madetech.com/). Key contributions:


* [Andrew Scott](https://github.com/askl56)
* [Rory MacDonald](https://github.com/rorymacdonald)
* [Seb Ashton](https://github.com/SebAshton)


## License
Copyright © 2016 [Made Tech Ltd](https://www.madetech.com/). It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
