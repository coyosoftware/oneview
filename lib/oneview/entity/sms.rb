module Oneview
  module Entity
    class Sms < Base
      attr_accessor :numbers, :message, :schedule
    end
  end
end