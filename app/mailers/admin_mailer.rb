# frozen_string_literal: true

# メールの送信機能
class AdminMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def order_email(order)
    @order = order
    admin = Admin.find(3)
    mail(to: admin.email, subject: 'ご注文内容')
  end
end
