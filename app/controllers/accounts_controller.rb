class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /sharks or /sharks.json
  def index
    @accounts = Account.all
  end

  # GET /sharks/1 or /sharks/1.json
  def show
  end

  # GET /sharks/new
  def new
    @account = Account.new
  end

  # GET /sharks/1/edit
  def edit
  end

  # POST /sharks or /sharks.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sharks/1 or /sharks/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to account_url(@account), notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @shark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sharks/1 or /sharks/1.json
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to account_url, notice: "Shark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_account
    if account_signed_in?
      @account = current_account
    else
      redirect_to new_account_session_path
    end
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:name, :user_name, :avatar)
  end
end
