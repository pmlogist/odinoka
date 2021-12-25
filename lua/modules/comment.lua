local ok, comment = pcall(require, "nvim_comment")
if ok then
  comment.setup {
    { comment_empty = false, comment_empty_trim_whitespace = false },
  }
end
