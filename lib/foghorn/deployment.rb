module Foghorn
  class Deployment

    attr_accessor :proxy, :basename, :unique_name, :environment, :infra

    def initialize(attrs={})
      attrs.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def name
      name = [basename]
      name << environment if environment
      name << unique_name if unique_name
      name << infra if infra and infra != "mtn"
      name.join('-')
    end

    def subdomain
      name.gsub(/-#{infra}/, ".#{infra}")
    end
  end
end
