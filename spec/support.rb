RSpec::Matchers.define(:request) do |method, url|
  match do |action|
    @stub = stub_request(method, url)
    @stub = @stub.with(@with) unless @with.nil?
    action.call
    expect(@stub).to have_been_requested
  end

  chain(:with) do |options|
    @with = options
  end

  def supports_block_expectations?
    true
  end
end
