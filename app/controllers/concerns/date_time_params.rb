module DateTimeParams
  extend ActiveSupport::Concern

  included do
    protected 
      def set_datetime(resource, field)
        params[resource][field] = Time.zone.local params[resource].delete("#{field}(1i)").to_i,
                                                  params[resource].delete("#{field}(2i)").to_i,
                                                  params[resource].delete("#{field}(3i)").to_i,
                                                  params[resource].delete("#{field}(4i)").to_i,
                                                  params[resource].delete("#{field}(5i)").to_i
      rescue
      end
  end
end