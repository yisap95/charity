class MoneyContactController < ApplicationController


  def setup_acc

    plaidUser = Plaid::User.exchange_token(
        @plaid_public_token,
        @plaid_acc_id,
        product: :auth
    )
    bank_account_token = plaidUser.stripe_bank_account_token

    stripeUser =Stripe::Customer.create(
        :description => "",
        :source => bank_account_token
    )
    stripeUser_id = stripeUser.id
    render json: {:msg => "success"}
  end

  def webhook_in
    #comes in with json_string

    webhook_hash = JSON.parse(@params)

    webhook = Plaid::Webhook.new(webhook_hash)

    # Was that the Initial Transaction Webhook?
    webhook.initial_transaction?
    access_token = webhook.access_token
    total_transactions = webhook.total_transactions

    # Or did Historical Transactions become available?
    webhook.historical_transaction?
    access_token = webhook.access_token
    total_transactions = webhook.total_transactions

    # Or did Normal Transactions become available?
    webhook.normal_transaction?
    access_token = webhook.access_token
    total_transactions = webhook.total_transactions

    # Or maybe a transaction was removed?
    webhook.removed_transaction?
    access_token = webhook.access_token
    removed_transactions_ids = webhook.removed_transactions_ids

    # Or was the User's Webhook Updated?
    webhook.user_webhook_updated?
    access_token = webhook.access_token

    # Otherwise, was it an error?
    webhook.error_response?
    # Which error?
    error = webhook.error
    render json: {:msg => "success"}
  end




end
