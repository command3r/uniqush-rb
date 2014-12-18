require "spec_helper"

describe Uniqush::RestfulClient do
  let(:base_url) { "http://yourinstall.com" }
  let(:client) { described_class.new(base_url) }
  let(:a_hash) { {foo: "bar", baz: "bam"} }

  describe "services" do
    it "adds service" do
      expect { client.add_service(a_hash) }.
        to request(:post, "#{base_url}/push_service_providers").with(body: a_hash.to_json)
    end
  end

  describe "subscriptions" do
    it "subscribes" do
      expect { client.subscribe_device(a_hash) }.
        to request(:post, "#{base_url}/subscribers").with(body: a_hash.to_json)
    end
  end

  describe "pushing" do
    it "pushes" do
      expect { client.push(a_hash) }.
        to request(:post, "#{base_url}/push").with(body: a_hash.to_json)
    end
  end
end
