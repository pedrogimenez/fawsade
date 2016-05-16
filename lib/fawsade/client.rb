module Fawsade
  class Client
    def initialize(region:, access_key_id:, secret_access_key:)
      @client = Aws::EC2::Client.new(
        region: region,
        access_key_id: access_key_id,
        secret_access_key: secret_access_key)
    end

    def instance_by_id(id)
      instances.find { |instance| instance.id == id }
    end

    def instances_by_name(regex)
      instances.select { |instance| instance.name =~ /^#{regex}$/ }
    end

    def method_missing(method_name, *parameters, &block)
      @client.send(method_name, *parameters, &block)
    end

    private

    def instances
      @client.describe_instances.reservations.each_with_object([]) do |reservation, array|
        reservation.instances.each do |instance|
          next unless running?(instance) && instance.tags.any?

          array << build(instance)
        end
      end
    end

    def running?(instance)
      instance.state.name == "running"
    end

    def build(instance)
      Instance.new(instance.instance_id, instance.private_dns_name, name_of(instance))
    end

    def name_of(instance)
      instance.tags.find { |tag| tag.key == "Name" }.value
    end
  end
end
