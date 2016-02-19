module SessionFixHelper
  #TODO: Remove this monkeypatch
  #https://github.com/rails/rails/issues/15843#issuecomment-125784043
  if defined?(::ActionDispatch::Request::Session) &&
      !::ActionDispatch::Request::Session.respond_to?(:each)
    class ActionDispatch::Request::Session
      def each(&block)
        hash = self.to_hash
        hash.each(&block)
      end
    end
  end
end
