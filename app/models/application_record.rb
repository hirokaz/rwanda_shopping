# frozen_string_literal: true

# ApplicationRecordはActiveRecord::Baseを継承したベースモデルです。
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
