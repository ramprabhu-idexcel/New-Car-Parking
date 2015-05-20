class Error
  class << self
    def input
      "\n Input arguments are mis-matching..."
    end

    def file_type
      "\n File should be a text file"
    end

    def file_read
      "\n File doesn't exist"
    end

    def not_found
      "Not found"
    end

    def parking_full
      "Sorry, parking lot is full"
    end
  end
end