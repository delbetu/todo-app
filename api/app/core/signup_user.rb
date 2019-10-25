require_relative 'dto'

class SignupUser
  C = Contracts
  include C::Core

  # MAYBE: Extract and test separatelly ?
  class UserData < Value.new(:name, :email, :password)
    InvalidData = Class.new(StandardError)
    def weak_password_message
      'Password must contain at least a lowercase letter, a uppercase, a digit and 8+ chars'.freeze
    end
    def invalid_name_message
      'Name must have between 3 and 60 letters.'.freeze
    end
    def invalid_email_message
      'Malformed email'.freeze
    end

    def validate
      raise InvalidData, invalid_name_message  unless 3 <= name.length && name.length <= 60
      raise InvalidData, invalid_email_message unless email.match?(URI::MailTo::EMAIL_REGEXP)
      raise InvalidData, weak_password_message unless !!password[/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/]
      self
    end
  end

  Contract(C::KeywordArgs[
    name: String, email: String, password: String, data_provider: C::RespondTo[:create]
  ] => C::Num)
  def self.call(name:, email:, password:, data_provider:)
    user_data = UserData.new(name, email, password).validate
    data_provider.create(user_data.to_h)
  end
end
