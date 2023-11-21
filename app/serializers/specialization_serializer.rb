class SpecializationSerializer
  include JSONAPI::Serializer
  attributes :name
  attribute :created_date do |specialization|
    specialization.created_at && specialization.created_at.strftime('%m/%d/%Y')
  end
end
