class ReturnsController < ApplicationController

  # before_action :authenticate_user!
  before_action :check_client_service_officer, only: [:new, :create]
  before_action :check_warehouse_operator, only: [:edit, :update]


  def index
    @returns = Return.includes(:order).all
  end

  def new
    @return = Return.new
  end

  def create
    @return = Return.new(return_params)
    @return.client_service_officer_id = current_user.id

    if @return.save
      redirect_to @return, notice: 'Return was successfully created.'
    else
      render :new
    end
  end

  def update
    @return = Return.find(params[:id])
    if @return.update(return_params)
      redirect_to returns_path, notice: 'Return was successfully updated.'
    else
      render :edit
    end
  end

  private

  def return_params
    params.require(:return).permit(:order_id, :warehouse_operator_id, :client_service_officer_id, return_items_attributes: [:order_item_id])
  end

  def check_client_service_officer
    unless current_user.client_service_officer?
      flash[:alert] = "You are not authorized to create returns."
      redirect_to root_path
    end
  end

  def check_warehouse_operator
    unless current_user.warehouse_operator?
      flash[:alert] = "You are not authorized to edit returns."
      redirect_to root_path
    end
  end
end
