# Turns a hash with nested keys into a flat 2 dimentional hash
# from: { wizard: { man: 'pig' } }
# into: { 'wizard-man': 'pig' }
class FlattenHash
  def self.call(hash, delimiter: '-')
    merged_hash = {}

    hash.each do |key, value|
      if value.is_a?(Hash)
        FlattenHash.call(value, delimiter: delimiter).map do |h_key, h_value|
          merged_hash["#{key}#{delimiter}#{h_key}".to_sym] = h_value
        end
      else
        merged_hash[key] = value
      end
    end

    merged_hash
  end
end
