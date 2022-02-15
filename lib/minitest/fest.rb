require_relative "fest/version"

module Minitest
  module Fest
    module Test
      def test(block=nil, &new_block)
        if block_given?
          new_block.call
          return new_block
        else
          block.call
        end
      end
    end

    # TODO: flip all assertions.
    module FlipAssert
      def assert_equal(asserted, expected)
        super(expected, asserted)
      end
    end
  end

  Spec.class_eval do
    include Fest::Test
    include Fest::FlipAssert
  end
end
