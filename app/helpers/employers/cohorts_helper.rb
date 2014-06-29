module Employers::CohortsHelper
  def github_url(url)
    if url =~ /^https?:\/\/(www.)?github.com/
      url
    else
      url.prepend 'https://github.com/'
    end
  end

  def linkedin_url(url)
    if url =~ /^https?:\/\//
      url
    else
      url.prepend 'https://linkedin.com/'
    end
  end
end
