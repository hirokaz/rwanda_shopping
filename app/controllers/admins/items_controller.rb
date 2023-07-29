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
    @item.images.attach(params[:item][:images]) if params[:item][:images].present?
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

  def delete_image
    image = ActiveStorage::Attachment.find(params[:image_id])
    image.purge
    redirect_to edit_admins_item_path(params[:id]), notice: 'Image was successfully deleted.'
  end

  def soldout
    @item = Item.find(params[:id])
    @item.soldout!
    @item.save
    redirect_to edit_admins_item_path(@item), notice: 'Item is now sold out.'
  end
  
  def fix
    @item = Item.find(params[:id])
    @item.fix!
    @item.save
    redirect_to edit_admins_item_path(@item), notice: 'Item is now unreserved'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :size, :status, :category_id, :quantity, images_attachments_attributes: [ :id, :_destroy ])
  end
end
