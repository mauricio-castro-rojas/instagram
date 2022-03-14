class AccountsController < ApplicationController
  before_action :authenticate_account!
  def home

  end

  def show
    @account = Account.find(params[:id])
  end

end
