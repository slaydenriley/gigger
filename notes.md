Planning for this Project:

Models:

  -User
    -belongs_to :band
    -belongs_to :venue
    -has_many :gigs, through: bands

      -name: string
      -email: string
      -password_digest: string
      -description: text
      -band_id:integer, default: nil
      -venue_id:integer, default: false

    -rails g resource User name email password_digest description:text band_id:integer --no-test-framework


  -Band
    -has_belongs_to_many :users
    -has_many :gigs
    -has_many :venues, through: :gigs
    -belongs_to :genre

      -name: string
      -email: string
      -genre: string
      -description: text

    -rails g resource Band name genre description:text genre_id:integer --no-test-framework


  -Venue
    -had_many :users
    -has_many :gigs
    -has_many :bands, through: :gigs

      -name: string
      -email: string
      -description: text

    -rails g resource Venue name description:text --no-test-framework


  -Gig
    -belongs_to :band
    -belongs_to :venue

      -name:string
      -date:datetime
      -band_id:integer
      -venue_id:integer
      -genre_id:integer

    -rails g resource Gig name date:date time:time band_id:integer venue_id:integer --no-test-framework

  -Genre
    -has_many :bands

      -name:string

    -rails g resource Genre name --no-test-framework



    <%= f.fields_for :bands_attributes, @user.bands.build do |band| %>
      <%= band.label :name %><br/>
      <%= band.text_field :name %><br/>
      <%= band.label :email %><br/>
      <%= band.text_field :email %><br/>
      <%= band.label :description %><br/>
      <%= band.text_field :description %><br>
    <% end %>

    if params[:type] = "band_member"
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :description,
        :type,
        band_ids:[],
        bands_attributes:[
          :name,
          :email,
          :description,
          :genre_id,
          genre_attributes:[:name]
        ]
      )
      elsif params[:type] = "venue_manager"
        params.require(:user).permit(
          :name,
          :email,
          :password,
          :description,
          :type,
          venue_ids:[],
          venues_attributes:[
            :name,
            :description,
            :email
          ]
        )
      elsif params[:type] = "concert_goer"
        params.require(:user).permit(
          :name,
          :email,
          :password,
          :description,
          :type
        )
      end

      <h2>Select Existing Band</h2>
        <%= f.collection_select :band_ids, Band.all, :id, :name, prompt: true %>
        <br/>
      <h2>Create a New Band</h2>
        <%= f.fields_for :bands, @user.bands.build do |band| %>
          <%= band.label :name %><br/>
          <%= band.text_field :name %><br/>
          <%= band.label :email %><br/>
          <%= band.text_field :email %><br/>
          <%= band.label :description %><br/>
          <%= band.text_area :description %><br/>
          <%= band.label :genre_id %><br/>
          <h3>Select or Add New Genre</h3>
          <%= band.collection_select :genre_id, Genre.all, :id, :name, prompt: true %><br/>
          <br/>
          <%= band.label :genre %>
          <%= band.text_field :genre %>
        <% end %>
        <br/>

      <!---Venue Creation-->

        <h2>Select Existing Venue</h2>
          <%= f.collection_select :venue_ids, Venue.all, :id, :name, prompt: true %>
        <h2>Create a New Venue</h2>
        <%= f.fields_for :venues, @user.venues.build do |venue| %>
          <%= venue.label :name %><br/>
          <%= venue.text_field :name %><br/>
          <%= venue.label :email %><br/>
          <%= venue.text_field :email %><br/>
          <%= venue.label :description %><br/>
          <%= venue.text_area :description %><br/>
        <% end %>
        <%= f.submit "Create Account" %>
      <% end %>





      <!---  f.collection_select :band_id, Band.all, :id, :name <br/> -->
