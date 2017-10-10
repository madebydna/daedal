module Daedal
  module Queries
    "" "Class for the basic terms query" ""
    class TermsQuery < Query

      # required attributes
      attribute :field, Daedal::Attributes::Field
      attribute :terms, Array[Daedal::Attributes::QueryValue]

      def to_hash
         {terms: {field => terms}}
      end
    end
  end
end
