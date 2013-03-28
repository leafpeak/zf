actions :create, :delete

attribute :version, :kind_of => String

def initialize(*args)
  super
  @action = :create
end