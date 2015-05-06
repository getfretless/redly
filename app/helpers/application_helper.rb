module ApplicationHelper
  def flash_class(name)
    bootstrap_class = case name.to_s
      when 'notice'  then 'alert-success'
      when 'error'   then 'alert-danger'
      when 'alert'   then 'alert-danger'
      when 'info'    then 'alert-info'
      when 'warning' then 'alert-warning'
      else "alert-#{name}"
    end
    bootstrap_class
  end

  def post_link(post)
    return post.link if post.link?
    return post_path(post) if post.text?
  end
end
