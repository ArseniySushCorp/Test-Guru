module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_link(author, repo)
    link_to 'Github',
            "https://github.com/#{author}/#{repo}",
            class: 'grey-text text-lighten-4 right',
            target: '_blank', rel: 'nofollow'
  end
end
