require 'fog/core'
require 'fog/json'
require 'fog/artifactory/version'
require 'artifactory'

module Fog
  module Storage
    autoload :Artifactory, File.expand_path('../artifactory/storage', __FILE__)
  end

  module Artifactory
    extend Fog::Provider

    service(:storage, 'Storage')
  end
end
