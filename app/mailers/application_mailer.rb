# frozen_string_literal: true

# ApplicationMailerクラスは、メール送信のための基本的な機能を提供します。
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
