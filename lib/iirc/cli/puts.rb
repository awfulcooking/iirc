# frozen_string_literal: true

module IIRC
  # Overrides puts to use terminal escape sequences to avoid
  # disrupting an input line at the bottom of the screen.
  #
  # Look ma, no curses!
  module CLI::Puts
    OUTPUT = STDOUT
    
    require 'pry'

    class << self
      def included(*) require 'io/console' end
      alias extended  included
      alias prepended included

      @@pry_mutex ||= Mutex.new.tap {
        n = 0
        Pry.config.prompt = Pry::Prompt.new(
          'iirc',
          'iirc_prompt',
          [proc {
            n += 1
            CLI::Puts.bottom!
            CLI::Puts.print "\x1b[K"
            "%03d> " % n
          }]
        )

        Pry.hooks.add_hook(:before_eval, "iirc_after_read") {
          @@pry_mutex.lock
          # CLI::Puts.store_cursor!
          # CLI::Puts.scroll_region! nil, nil
          CLI::Puts.scroll_region! nil, nil
          CLI::Puts.cursor! OUTPUT.winsize[0]-4, 0
          CLI::Puts.print "\x1b[K"
          # CLI::Puts.cursor! OUTPUT.winsize[0]-3, 0
          # CLI::Puts.print "\x1b[K"
        }
  
        Pry.hooks.add_hook(:after_eval, "iirc_after_eval") {
          # CLI::Puts.puts "(after eval..)"
          CLI::Puts.scroll_region!
          # CLI::Puts.restore_cursor!
          CLI::Puts.cursor! OUTPUT.winsize[0]-3, 0
          @@pry_mutex.unlock
        }
      }

      def synchronize(&blk)
        if @@pry_mutex.owned?
          @@mutex ||= Mutex.new
          if @@mutex.owned?
            yield
          else
            @@mutex.synchronize(&blk)
          end
        else
          @@pry_mutex.synchronize { synchronize(&blk) }
        end
      end

      def puts(*args)
        synchronize { OUTPUT.puts(*args) }
      end

      def print(*args)
        synchronize { OUTPUT.print(*args) }
      end

      def cursor!(row, col)
        synchronize { OUTPUT.cursor = [row, col] }
      end

      def top!(top=0, left=0, message=nil)
        cursor! top, left
        puts(message) if message
      end

      def bottom!(bottom=0, left=0, message=nil)
        cursor! OUTPUT.winsize[0]-bottom, left
        puts(message) if message
      end

      def scroll_region!(top=1, last_row=OUTPUT.winsize[0]-2)
        print "\x1b[#{top};#{last_row}r"
      end

      def store_cursor!() print "\x1b7" end
      def restore_cursor!() print "\x1b8" end
    end

    def puts(*args)
      num_lines = OUTPUT.winsize[0]

      CLI::Puts.synchronize {
        CLI::Puts.store_cursor!
        CLI::Puts.scroll_region!(1, num_lines-2); # 3,1
        CLI::Puts.cursor! num_lines-3, 0
        CLI::Puts.puts(*args.map { "   #{puts_prefix} #{_1}" })
        CLI::Puts.scroll_region!(1, num_lines)
        CLI::Puts.restore_cursor!
      }
    end

    require 'paint'

    COLORS = ['yellow', 'medium spring green', 'green yellow', 'aquamarine', 'orange red', 'turquoise1', 'cyan', 'magenta', 'VioletRed1']
    @@color_index = 0

    def puts_prefix
      @puts_color ||= COLORS[(@@color_index += 1) % COLORS.count]
      Paint[me.to_s, @puts_color]
    end
  end
end
