class User < ActiveRecord::Base

  def self.setup_acc (plaid_public_token, plaid_acc_id)

    plaidUser = Plaid::User.exchange_token(
        plaid_public_token,
        plaid_acc_id,
        product: :auth
    )

    bank_account_token = plaidUser.stripe_bank_account_token
    access_token = plaidUser.access_token

    stripeUser = Stripe::Customer.create(
        :description => "",
        :source => bank_account_token
    )

    user = User.new(last_name: "",
                    first_name: "",
                    fb_auth: "",
                    total_amount: 0,
                    total_transactions: 0,
                    stripe_user_id: stripeUser.id,
                    plaid_access_token: access_token)

  end


end
