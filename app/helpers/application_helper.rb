module ApplicationHelper
  # def show_page(name)
  # 	return "An error accured during showing this content. Please contact with administrator" if name.strip == ""
  # 	page = StaticPage.where('name = ?', name)

  # 	text = "" #just to make that two global
  # 	link = ""
  # 	if page.size != 0
  # 		link = edit_admin_static_page_path(page.first)
  # 		text = page.first.content
  # 	else
  # 		page = StaticPage.new()
  # 		page.name = name
  # 		page.save()
  # 		link = edit_admin_static_page_path(page)
  # 	end
  # 	if text.blank?
  # 		text = "There is no text available. If you are admin, please add it <a href='#{link}'>here</a><p>"
  # 	end
  # 	return text
  # end
  def show_page(name)
    page = StaticPage.find_by_name(name)
    page ? text = page.content : page = StaticPage.create!(:name => name)
    text.blank? ? text = "<p>There is no text available. If you are admin, please add it #{ link_to 'here', edit_admin_static_page_path(page) }.</p>" : text
  end

  # def link_to_page(name)
  # 	return "An error accured during showing this content. Please contact with administrator" if name.strip == ""
  # 	page = StaticPage.where('name = ?', name)
  # 	link = ""  #just to make this global
  # 	if page.size != 0
  # 		link = static_page_path(page.first)
  # 	else
  # 		page = StaticPage.new()
  # 		page.name = name
  # 		page.save()
  # 		link = static_page_path(page)
  # 	end
  # 	return link
  # end
  def link_to_page(name)
    page = StaticPage.find_by_name(name)
    page = StaticPage.create!(:name => name) unless page
    static_page_path(page)
  end
end
