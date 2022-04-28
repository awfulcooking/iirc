# frozen_string_literal: true

require "test_helper"

describe IIRC::Event do
  describe "CTCP messages" do
    let(:evt) { IIRC::Event.new }

    it "identifies CTCP messages" do
      evt.args = ["#channel", "\x01FOO\x01"]
      assert evt.ctcp?
    end

    it "identifies the command of a CTCP message" do
      evt.args = ["#channel", "\x01VERSION\x01"]
      assert_equal [:version], evt.ctcp
    end

    it "identifies the command and text of an extended CTCP message" do
      evt.args = ["#channel", "\x01ACTION does a thing?!\x01"]
      assert_equal [:action, "does a thing?!"], evt.ctcp
    end

    # @see https://modern.ircdocs.horse/ctcp.html#message-syntax
    it "parses CTCP messages without the final delimiter" do
      evt.args = ["#channel", "\x01ACTION sends a weird CTCP"]
      assert_equal [:action, "sends a weird CTCP"], evt.ctcp
    end

    it "works with pattern matching" do
      evt.args = ["#hello", "\x01ACTION pattern matches\x01"]
      evt.ctcp in [:action, msg]

      assert_equal "pattern matches", msg
    end
  end
end
