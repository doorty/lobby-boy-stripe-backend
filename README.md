Example Lobby Boy Backend
====

This is a really simple webapp that you can use to test your own Stripe account instead of the [default one](http://lobbyboy.herokuapp.com) in [Lobby Boy](https://github.com/supportkit/lobby-boy). This code is based off of [Stripe's example](https://github.com/stripe/example-ios-backend).

It has a two endpoints:
`/user`, which takes 3 parameters (`stripeToken`, `email`, and `name`) to create a customer on your Stripe account.
`/charge`, which takes 2 parameters (`customerId` and `amount`) to create a charge for a customer on your Stripe account.

This is intended for example purposes only: you'll likely need something more serious for your production apps.

To deploy this for free on Heroku, click this button:

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Then set the `kPaymentServerBaseUrl` variable in our Lobby Boy app to your Heroku URL (it'll be in the format https://my-example-app.herokuapp.com).

Happy Lobby Boying!
