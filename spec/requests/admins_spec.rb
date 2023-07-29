require 'rails_helper'

RSpec.describe "Admins::ItemsController", type: :request do
  before do
    @categories = Category.all
    @item = FactoryBot.create(:item)
  end

  

  context "adminsにサインインしている場合" do
    before do
        @admin = FactoryBot.create(:admin)
        sign_in @admin
    end

    it 'adminのみがreservedからsoldに変更できる' do
      @reserved_item = FactoryBot.create(:item, :reserved)
      patch soldout_admins_item_path(@reserved_item)
      expect(response).to have_http_status(302)
    end

    it 'fixにアクセスできる' do
      patch fix_admins_item_path(@item)
      expect(response).to have_http_status(302)
    end

    it 'delete_imageにアクセスできる' do
      delete delete_image_admins_item_path(@item, image_id: @item.images.first.id)
      expect(response).to have_http_status(302)
    end
  end

  context "adminsにサインインしていない場合" do
    it 'soldoutにアクセスできない' do
      patch soldout_admins_item_path(@item)
      expect(response).to have_http_status(302) # もしくは 401 や 403 など適切なリダイレクトまたはエラーのステータスコード
    end

    it 'fixにアクセスできない' do
      patch fix_admins_item_path(@item)
      expect(response).to have_http_status(302) # もしくは 401 や 403 など適切なリダイレクトまたはエラーのステータスコード
    end

    it 'adminのみがreservedからsoldに変更できる' do
        @reserved_item = FactoryBot.create(:item, :reserved)
        patch soldout_admins_item_path(@reserved_item)
        expect(response).to have_http_status(302)
    end

    it 'delete_imageにアクセスできない' do
      delete delete_image_admins_item_path(@item)
      expect(response).to have_http_status(302) # もしくは 401 や 403 など適切なリダイレクトまたはエラーのステータスコード
    end
  end
end
