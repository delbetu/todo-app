require 'core_helper'

describe SignupUser do
  let(:dp_succeed) do
    Class.new do
      extend DataProviderPort

      def self.create(attributes)
        @@args = attributes
        generated_id = 1
      end

      def self.called_with?(attrs)
        @@args == attrs
      end
    end
  end

  let(:dp_failing_with_repeated_email) do
    Class.new do
      include DataProviderPort

      def self.create(attributes)
        raise DataProviderPort::ResourceSavingError, 'email already taken'
      end
    end
  end

  it 'creates a user with the given email and name' do
    user_data = { name: 'ValidName', email: 'valid@email.com', password: 'ValidPwd1' }

    id = SignupUser.call(user_data.merge(data_provider: dp_succeed))

    expect(id).to eq(1)
    expect(dp_succeed).to be_called_with(user_data)
  end

  it 'raises error when the email is already taken' do
    user_data = { name: 'ValidName', email: 'valid@email.com', password: 'ValidPwd1' }

    expect {
      id = SignupUser.call(user_data.merge(data_provider: dp_failing_with_repeated_email))
    }.to raise_error(DataProviderPort::ResourceSavingError, 'email already taken')
  end

  it 'raises weak password error when the password do not pass the strong password policy' do
    user_data = { name: 'ValidName', email: 'valid@email.com', password: '1234' }

    message = 'Password must contain at least a lowercase letter, a uppercase, a digit and 8+ chars'

    expect {
      id = SignupUser.call(user_data.merge(data_provider: dp_succeed))
    }.to raise_error(SignupUser::UserData::InvalidData, message)
  end
end
