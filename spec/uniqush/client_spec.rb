require "spec_helper"

describe Uniqush::Client do
  let(:base_url) { "http://yourinstall.com" }
  let(:client) { described_class.new(base_url) }
  let(:a_hash) { {foo: "bar", baz: "bam"} }

  describe "services" do
    it "adds service" do
      expect { client.add_service(a_hash) }.
        to request(:get, "#{base_url}/addpsp").with(query: a_hash)
    end

    it "removes service" do
      expect { client.remove_service(a_hash) }.
        to request(:get, "#{base_url}/rmpsp").with(query: a_hash)
    end
  end

  describe "subscriptions" do
    it "subscribes" do
      expect { client.subscribe_device(a_hash) }.
        to request(:get, "#{base_url}/subscribe").with(query: a_hash)
    end

    it "unsubscribes" do
      expect { client.unsubscribe_device(a_hash) }.
        to request(:get, "#{base_url}/unsubscribe").with(query: a_hash)
    end
  end

  describe "pushing" do
    it "pushes" do
      expect { client.push(a_hash) }.
        to request(:get, "#{base_url}/push").with(query: a_hash)
    end
  end

  describe "housekeeping" do
    it "gets version" do
      expect { client.version }. to request(:get, "#{base_url}/version")
    end

    it "stops" do
      expect { client.stop }. to request(:get, "#{base_url}/stop")
    end
  end
end
