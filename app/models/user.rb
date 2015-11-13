#
class User < ActiveRecord::Base
  include Authentication

  has_one :profile, autosave: true
end
