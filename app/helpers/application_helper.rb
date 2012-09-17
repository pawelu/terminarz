# encoding: utf-8

module ApplicationHelper
  def link_to_add_dates(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, :child_index => id) do |builder|
      render("form_dates", :f => builder)
    end
    link_to 'Dodaj kolejną datę', '#', :class => 'add_date', :data => { :id => id, :fields => fields.gsub("\n", "") }
  end
end
