class Edit < ActiveRecord::Base
  belongs_to :editor, class_name: 'User'
  belongs_to :article

  def find_differences(article)
    self.difference = Diffy::Diff.new(article.edits.last.content, self.content, context: 1).to_s
    # self.difference = self.content - article.edits.last.content
  end
end
