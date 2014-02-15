class AdventuresController < ApplicationController

def index
  @adventures = Adventure.all
end

def new
end

def create
end

end
