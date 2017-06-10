class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :set_form_selects, only: [:new, :edit, :create, :update]
  before_action :set_trans_type
  before_action :authorize_owner, only: [:new, :edit, :create, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = trans_type_class.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = trans_type_class.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = trans_type_class.new(transaction_params)

    respond_to do |format|
      if @transaction.save!
        format.html { redirect_to @transaction, notice: '#{trans_type_class} was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: '#{trans_type_class} was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: '#{trans_type_class} was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = trans_type_class.find(params[:id])
    end
    
    def set_trans_type
      @trans_type = trans_type
    end

    def trans_type
      Transaction.trans_types.include?(params[:type]) ? params[:type] : "Transaction"
    end
    
    def trans_type_class
      trans_type.constantize
    end
    
    def set_form_selects
      @farms = current_user.farms
      @methods = [['Cash', 'Cash'], ['Cheque', 'Cheque'], ['Internet Transfer', 'Internet']]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(trans_type.underscore.to_sym).permit(:reason, :location, :bill_image_path, 
      :description, :debit_credit, :amount, :trans_type, :farm_id, :crop_id, :transaction_date,
      :transaction_method, :identifier, :created_by, :updated_by, :place_of_transaction)
    end
end
