module Oneview
  module Entity
    class Email < Base
      attr_accessor :from, :to, :body, :subject, :schedule
    end
  end
end