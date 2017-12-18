module ArticleHelper
  def fill_form(article)
    # fill_in 'Title', with: ''
    puts article.inspect
    article.each do |field, val|
      puts field, val
      fill_in field, with: val
    end
  end
end
