# frozen_string_literal: true

RSpec.describe Rubira::Comment do
  let(:comment_hash) { build(:comment) }

  context 'with comment hash' do
    subject(:comment) { described_class.new(comment_hash) }

    it 'sets author' do
      expect(comment.author.display_name)
        .to eq comment_hash['author']['displayName']
    end

    it 'sets update author' do
      expect(comment.update_author.display_name)
        .to eq comment_hash['updateAuthor']['displayName']
    end

    it 'sets body' do
      expect(comment.body).to eq comment_hash['body']
    end

    it 'sets created' do
      expect(comment.created).to be_a(Rubira::Timestamp)
    end

    it 'sets updated' do
      expect(comment.updated).to be_a(Rubira::Timestamp)
    end
  end
end
