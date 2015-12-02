# -*- coding: utf-8 -*-
module FileSetHelper
  def display_title(fs)
    fs.to_s
  end

  def present_terms(presenter, terms = :all, &block)
    terms = presenter.terms if terms == :all
    Sufia::PresenterRenderer.new(presenter, self).fields(terms, &block)
  end

  def render_collection_list(fs)
    return if fs.collections.empty?
    ("Is part of: " + fs.collections.map { |c| link_to(c.title, collections.collection_path(c)) }.join(", ")).html_safe
  end

  def display_multiple(value)
    auto_link(value.join(" | "))
  end

  private

    def render_visibility_badge
      if can? :edit, @file_set
        render_visibility_link @file_set
      else
        render_visibility_label @file_set
      end
    end
end
