require 'fog/core/model'
require 'fog/artifactory/models/storage/files'

module Fog
  module Storage
    class Artifactory
      class Directory < Fog::Model
        identity :key, aliases: ['path']

        attribute :size
        attribute :rev
        attribute :bytes
        attribute :last_modified, aliases: ['client_mtime']

        def destroy
          # TODO: implement
        end

        def files
          # TODO: implement
        end

        def save
          # TODO: implement
        end
      end
    end
  end
end
