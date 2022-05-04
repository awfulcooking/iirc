# frozen_string_literal: true

require "stringio"
require "test_helper"

describe IIRC::Bot do
  describe "Sending lines (<<)" do
    let(:buffer) { StringIO.new }
    let(:bot) { IIRC::Bot.new(buffer) }

    it "appends \\r\\n to lines" do
      bot << "HELLO :world"
      assert_equal "HELLO :world\r\n", buffer.string
    end

    describe "Sends just one line at a time" do
      it "strips any \\r or \\n characters" do
        bot << "\rThe \rsun\n is :shining. \r\r\r\nThough it\r's\n\r \rraining\r\n in my \nheart.\r\r"
        assert_equal "The sun is :shining. Though it's raining in my heart.\r\n", buffer.string
      end
    end
  end
end
