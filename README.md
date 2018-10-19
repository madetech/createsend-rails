# Campaign Monitor - Smart Transactional Emails for Rails

[![Build Status](https://travis-ci.org/madetech/createsend-rails.svg?branch=master)](https://travis-ci.org/madetech/createsend-rails)


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

Once that's done, you can create a simple example Mailer :
```ruby
class UserMailer < ApplicationMailer
  def user_registered
    @user = params[:user]
    mail to: @user.email
  end
end

```

Now go into your `views/user_mailer/` and add a `user_registered.json.erb` view, which defines the data attributes required by your Smart Email template. Below is an example of a user activation email. Here, `@user` references the instance variable of the UserMailer we created.

```json
{
    "smart_email_id": "SMART_EMAIL_ID",
    "consent_to_track: "yes/no/unchanged",
    "language": "<%= @user.language %>",
    "name": "<%= @user.name %>",
    "token": "<%= @user.confirmation_token %>"
}
```

You can now trigger the email from anywhere you want, for example in an `after_create` callback on your User model :
```ruby
  class User < ApplicationRecord 
    after_create :send_activation_mail
    ...

    def send_activation_mail # The user we pass with the method 'with' is the one we receive in the mailer through params[:user]
      UserMailer.with(user: self).user_registered.deliver_later
    end
  end
```

## Credits

![made](https://s3-eu-west-1.amazonaws.com/made-assets/googleapps/google-apps.png)

Initialy developed by [Made Tech Ltd](https://www.madetech.com/). Key contributions:


* [Andrew Scott](https://github.com/askl56)
* [Rory MacDonald](https://github.com/rorymacdonald)
* [Seb Ashton](https://github.com/SebAshton)
* [Martin Vandersteen](https://github.com/MartinVandersteen) from [Koalect](https://www.koalect.com/)


## License
It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
