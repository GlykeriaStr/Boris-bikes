
class Bike
attr_reader  :report_broken

    def working?
      true
    end

    def report_broken
      @broken = true
    end

    def broken?
      @broken
    end

    def fix
      working?
    end

end
