require "byebug"

def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize ? true : false}
end

def no_valid_url?(urls)
    domains = [".com", ".net", ".io", ".org"]
    urls.none? { |url|
        verify_url(url)
    }

end
# Helper for no_valid_url?
def verify_url(url)
    domains = [".com", ".net", ".io", ".org"]
    domains.any? do |domain|
        url.end_with?(domain)
    end
end

def any_passing_students?(students)
    students.any? {|student| ((student[:grades].sum) / student.length) >= 75}
end
