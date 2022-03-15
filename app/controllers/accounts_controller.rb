class AccountsController < ApplicationController
  before_action :authenticate_account!
  def home
    if current_account
      redirect_to account_path(current_account.id)
    end
  end

  def show
    @account = Account.find(params[:id])
  end

end
