require 'spec_helper'

describe Daedal::Queries::TermsQuery do

  subject do
    Daedal::Queries::TermsQuery
  end

  let(:field) do
    :foo
  end

  let(:terms) do
    [:bar , :superfoo]
  end

  let(:hash_query) do
    {terms: {field => terms}}
  end

  context 'without a field or a list of terms specified' do
    it 'will raise an error' do
      expect {subject.new}.to raise_error(Virtus::CoercionError)
    end
  end

  context 'without a field specified' do
    it 'will raise an error' do
      expect {subject.new(terms: terms)}.to raise_error(Virtus::CoercionError)
    end
  end

  context 'with a field and a term specified' do
    let(:terms_query) do
      subject.new(field: field, terms: terms)
    end

    it 'will populate the field and term attributes appropriately' do
      expect(terms_query.field).to eq field
      expect(terms_query.terms).to eq terms
    end

    it 'will have the correct hash representation' do
      expect(terms_query.to_hash).to eq hash_query
    end

    it 'will have the correct json representation' do
      expect(terms_query.to_json).to eq hash_query.to_json
    end
  end

end
