# encoding: utf-8

module ROM::Cassandra

  # The collection of Cassandra-specific ROM commands
  #
  # @api public
  #
  module Commands

    include Immutability

    # @private
    def self.included(klass)
      klass.__send__ :adapter, :cassandra
      klass.__send__ :option,  :initial, default: true
    end

    # Restricts the relation by a corresponding request
    #
    def initialize(*)
      super
      @relation = relation.public_send(restriction)
    end

    # Implements the execute method of the `ROM::Command` abstract class
    #
    # @param [ROM::Command] command The updated command
    #
    # @return [Array]
    #   The empty array (Cassandra doesn't select rows when writes data).
    #
    def execute(command = self)
      command.to_a
    end

    private

    # Sends unknown methods to the <restricted> relation and returns
    # a new object, carrying updated relation
    #
    def method_missing(*args)
      __update__ { @relation = relation.public_send(*args) }
    end

    def respond_to_missing?(name, *)
      relation.respond_to? name
    end

  end # module Commands

  require_relative "commands/create"
  require_relative "commands/update"
  require_relative "commands/delete"
  require_relative "commands/batch"

end # module ROM::Cassandra
