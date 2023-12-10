class TagsController < ApplicationController
    def index
        @index = Tag.all
    end
end
