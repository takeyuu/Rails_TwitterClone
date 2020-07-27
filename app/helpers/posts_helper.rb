module PostsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create' || action_name == 'confirm'
      confirm_posts_path
    elsif action_name == 'edit' || action_name == 'update'
      confirm_post_path
    end
  end

  def confirm_new_or_edit
    @post.id ? post_path : posts_path
  end

  def confirm_form_method
    @post.id ? 'patch' : 'post'
  end
end
