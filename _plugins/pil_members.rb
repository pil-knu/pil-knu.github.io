# KNU-PIL: build author links and per-person publication queries from _members/.
#
# For every file in _members/ that has `bib_name: "Last, First"`:
#   1. adds an entry to site.data["coauthors"], so the author's name in any
#      publication list links to their page (or to `link:` if set, e.g. /lab-info/);
#   2. sets `bib_regex` on the member, used in a jekyll-scholar query that selects the
#      papers where this person is an author (used on their personal page).
#
# You never need to edit this file. Adding a member = adding one file to _members/.

module KnuPil
  class MembersGenerator < Jekyll::Generator
    safe true
    priority :high

    def generate(site)
      members = site.collections["members"]
      return unless members

      coauthors = site.data["coauthors"].is_a?(Hash) ? site.data["coauthors"] : {}

      members.docs.each do |doc|
        doc.data["title"] ||= doc.data["name"] # browser tab title on the personal page

        bib_name = doc.data["bib_name"].to_s.strip
        next if bib_name.empty?

        last, first = bib_name.split(",", 2).map { |part| part.to_s.strip }
        next if last.empty? || first.to_s.empty?

        # Page the author's name should link to.
        target = doc.data["link"].to_s.empty? ? doc.url : doc.data["link"]
        url = "#{site.config['baseurl']}#{target}"

        key = last.downcase
        first_names = [first] + Array(doc.data["bib_name_variants"])
        coauthors[key] = Array(coauthors[key]) + [{ "firstname" => first_names, "url" => url }]

        # jekyll-scholar splits query conditions on commas, so the comma between
        # last and first name is matched with "." instead. "\*?" allows the
        # co-first / corresponding-author asterisk (e.g. "Jo*, Dae Ung").
        name_regex = "#{Regexp.escape(last)}\\*?. #{Regexp.escape(first).gsub('\\ ', ' ')}"
        doc.data["bib_regex"] = name_regex
      end

      site.data["coauthors"] = coauthors
    end
  end
end
