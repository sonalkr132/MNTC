class User < ActiveRecord::Base
  # attr_accessible :title, :body
  include ActiveModel::ForbiddenAttributesProtection
end
