class Edit < ActiveRecord::Base
  belongs_to :editor, class_name: 'User'
  belongs_to :article

  def find_differences(article)
    if article.edits.length == 0
      self.difference = self.content
    else
      self.difference = Diffy::Diff.new(article.edits.last.content, self.content, context: 1).to_s
    end
  end
end
