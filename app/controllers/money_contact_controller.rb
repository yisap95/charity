class MoneyContactController < ApplicationController
  def chargeMoney
    user = Plaid::User.exchange_token(
        '[Plaid Link public_token]',
        '[Plaid Link account_id]',
    )
    bank_account_token = user.stripe_bank_account_token
  end
end
