# NOTE: data validation is not responsibility of data provider
module DataProviderPort
  C = Contracts
  include C::Core
  include C::Builtin

  ResourceNotFound = Class.new(StandardError)
  ResourceSavingError = Class.new(StandardError)
  InvalidOptions = Class.new(StandardError) # FIXME: Should this have a better name?

  # retrives objects matching given filters
  Contract({filters: Hash} => Array)
  def list(options)
    raise 'Not implemented'
  end

  # pre-requisite: Hash has valid values
  # Creates a resource for the given values and returns its id.
  Contract Hash => Num
  def create(resource_values)
    raise 'Not implemented'
  end

  # pre-requisite: Hash has valid values
  # errors: resource not found
  # Find resource for id and update their values according to attributes_hash
  Contract Num, Hash => nil
  def update(id, attributes_hash)
    raise 'Not implemented'
  end

  # errors: resource not found
  # Find and returns resource for the given id
  Contract Num => Any
  def get(id)
    raise 'Not implemented'
  end

  # errors: resource not found
  # Deletes definitively the resource for the given id
  Contract Num => nil
  def destroy(id)
    raise 'Not implemented'
  end
end
