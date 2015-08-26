# encoding: utf-8

module ROM::Cassandra

  module Commands

    # Defines methods shared by standard ROM commands (Create, Update, Delete).
    #
    module Executor

      # Implements the execute method of the `ROM::Command` abstract class
      #
      # @yield the block to specify the statement.
      #
      # @return [Array]
      #   The empty array (Cassandra doesn't select rows when writes data).
      #
      def execute(*, &block)
        (block_given? ? instance_eval(&block) : self).to_a
      end

      private

      def method_missing(name, *args)
        updated_relation = relation.public_send(name, *args)
        self.class.new updated_relation, initial: false
      end

      def respond_to_missing?(name, *)
        relation.respond_to? name
      end

    end # module Executor

  end # module Commands

end # module ROM::Cassandra
