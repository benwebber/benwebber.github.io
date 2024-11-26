return {
  {
    Link = function(el)
      if el.target:match('^https?://') then
        local rel = 'noopener noreferrer'
        if el.attributes['rel'] then
          rel = el.attributes['rel'] .. ' ' .. rel
        end
        el.attributes['rel'] = rel
      end
      return el
    end,
  },
}
