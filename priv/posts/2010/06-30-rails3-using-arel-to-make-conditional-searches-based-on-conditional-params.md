%{
title: "Rails3: using Arel to make conditional searches based on conditional params",
author: "Andrea Pavoni",
tags: ~w(rails ruby arel),
description: "I needed simple searching on some models, and I didn’t want to use any plugin for this task, just because I’d like to try the new rails3 features, like ActiveRelation (Arel)."
}

---

I wrote a basic model called Search, I can re-use it for other models that need search features:

```ruby
# put this in app/models/search.rb

class Search
  attr_accessor :attributes

  def initialize(attributes = {})
    @attributes = attributes
    @attributes.each do |k,v|
      self.class.send(:define_method,k) { v }
    end
  end
end
```

Then I wrote a partial form with params, the following code is only an example, I have more fields:

    <div id="searchform">
      <%= form_tag search_people_path, :method => 'get' do |f| %>
      <div class="field">
        <%= label :search, :firstname, 'Firstname' %><br />
        <%= text_field :search, :firstname %>
      </div>
      <div class="field">
        <%= label :search, :lastname, 'Lastname' %><br />
        <%= text_field :search, :lastname %>
      </div>
      <%= submit_tag "Search" %> <% end %>
    </div>

Finally the controller action called ‘search’. As you can see, the difficult part was that you don’t know which params are passed by the request, so you need to specify conditions only if they are present. Arel helped to resolve this problem:

```ruby
class PeopleController < ApplicationController
  # ... other CRUD actions ...

  def search
    q = Person.arel_table # initialize Arel table
    @people = Person.order(:created_at) # start with a simple option

    # initialize Search model with the search params
    @search = Search.new(params[:search])

    # apply conditions only if they are present
    @people = @people.where(q[:lastname].matches("%#{@search.lastname}%")) if @search.lastname
    @people = @people.where(q[:firstname].matches("%#{@search.firstname}%")) if @search.firstname

    # render index action, it's the same output, just filtered by conditions passed
    render :index
  end
end
```

Probably it’s not the best solution, perhaps this could be optimized with some helper, but it works, and helps to figure out how Arel works.

### Webografy:

- [Greg Pollack: Rails 3 Beautiful Code](http://www.slideshare.net/GreggPollack/rails-3-beautiful-code-3219240)
- [Ryan Bates: Advanced Queries in Rails 3](http://railscasts.com/episodes/215-advanced-queries-in-rails-3)
