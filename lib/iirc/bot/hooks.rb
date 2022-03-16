module IIRC
  module Bot::Hooks
    def hooks
      @hooks ||= Hash.new { |h,v| h[v] = Set.new }
    end

    def on verb=nil, action=nil, &blk
      if action and blk
        define_singleton_method(action, blk)
        singleton_class.send :private, action
      end

      if action or blk
        hooks[verb] << (action || blk)
      else
        hooks[verb]
      end
    end

    def hook action=nil, &blk
      on nil, action, &blk
    end

    def off verb, action=nil, &blk
      action ||= blk
      if action
        hooks[verb].delete action
      else
        hooks[verb].clear
      end
    end

    def fire! verb, *args, **kwargs
      for action in hooks[nil]
        call action, *args, **kwargs
      end
      if respond_to? :"on_#{verb}"
        send(:"on_#{verb}", *args, **kwargs)
      end
      for action in hooks[verb]
        call action, *args, **kwargs
      end
    rescue StopIteration
      StopIteration
    end

    def call action, *args, **kwargs
      case action
      when Symbol
        args = method(action).arity.then { |n| n.negative? ? args : args[...n] }
        send(action, *args, **kwargs)
      else
        action.call(*args, **kwargs)
      end
    end

    def run
      lines { |line|
        begin
          evt = parse(line)
          fire! evt.verb, evt
        rescue Exception => ex
          puts ex.message
          puts ex.backtrace
        end
      }
    end
  end
end