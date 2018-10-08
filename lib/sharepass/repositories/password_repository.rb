class PasswordRepository < Hanami::Repository
  def find_by_slug(slug)
    passwords.where(slug: slug).first
  end
end
