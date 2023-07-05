# frozen_string_literal: true

# Admins::ItemsControllerに関する説明や機能などを記述する
class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only: %i[edit update destroy]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.images.attach(params[:item][:images]) if params[:item][:images].present?
    if @item.save
      flash[:success] = 'Adding item is Successful'
      redirect_to admins_items_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @item.images.attach(params[:item][:images]) if @item.images.blank?
    if @item.update(item_params)
      flash[:success] = 'Success'
      redirect_to admins_items_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id]).destroy
    flash[:success] = 'item deleted'
    redirect_to admins_items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :size, :status, :category_id, :quantity, images: [])
  end
end
