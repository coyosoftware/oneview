module Oneview
  module Entity
    class Sms < Base
      attr_accessor :to, :message, :schedule
    end
  end
end