require 'fog/core/model'
require 'fog/artifactory/models/storage/files'

module Fog
  module Storage
    class Artifactory
      class Directory < Fog::Model
        identity :key

        attribute :description
        attribute :url

        def destroy
          false
        end

        def files
          requires :key
          @files ||= Fog::Storage::Artifactory::Files.new(directory: self, service: service)
        end

        def save
          true
        end
      end
    end
  end
end
