require_relative 'rails_helper'

describe 'model for -' do
  let!(:category) { Category.create!(name: 'Birthday') }
  let!(:editor) { User.create!(username: "candleperson", email: "candle@candle.com", admin: true, password: "password") }
  let!(:commenter) { User.create!(username: "critic", email: "critic@critic.com", password: "ihateit") }
  let!(:article) { Article.create!(title:'My First Birthday', category: category) }
  let!(:edit) { Edit.create!( article: article, editor: editor, content: "Created by a monk to celebrate his dog's first birthday") }
  let!(:comment) { Comment.create!(commenter: commenter, article: article, content: 'I heard it was a turtle') }

  describe User do
    it 'has a username' do
      expect(editor.username).to eq('candleperson')
    end

    it 'has an email' do
      expect(editor.email).to eq('candle@candle.com')
    end

    it 'has a password' do
      expect(editor.password).to eq('password')
    end

    it 'can be an editor with edits' do
      expect(editor.edits.first).to eq(edit)
    end

    it 'can be an editor with edited articles' do
      expect(editor.edited_articles.first).to eq(article)
    end

    it 'can be a commenter with comments' do
      expect(commenter.comments.first).to eq(comment)
    end

    it 'can be a commenter with commented articles' do
      expect(commenter.commented_articles.first).to eq(article)
    end
  end

  describe Article do
    it 'belongs to a category' do
      expect(article.category).to eq(category)
    end

    it 'has many edits' do
      expect(article.edits.first).to eq(edit)
    end

    it 'has many editors' do
      expect(article.editors.first).to eq(editor)
    end

    it 'has many comments' do
      expect(article.comments.first).to eq(comment)
    end

    it 'has many commenters' do
      expect(article.commenters.first).to eq(commenter)
    end

    it 'can be published by a user' do
      expect{article.publish}.to change{article.published}
    end

    it 'can be unpublished by a user' do
      article.publish
      expect{article.unpublish}.to change{article.published}
    end

    it 'can be featured by an admin if published' do
      article.publish
      expect{article.feature}.to change{article.featured}
    end

    it 'can be searched' do
      expect(Article.matched_articles('First')[0]).to eq(article)
    end
  end

  describe Comment do
    it 'belongs to a commenter' do
      expect(comment.commenter).to eq(commenter)
    end

    it 'belongs to an article' do
      expect(comment.article).to eq(article)
    end
  end

  describe Category do
    it 'can have published articles' do
      article.publish
      expect(category.published_articles[0].published).to eq(article.published)
    end

    it 'can be searched' do
      expect(Category.matched_categories('day')[0]).to eq(category)
    end
  end
end
