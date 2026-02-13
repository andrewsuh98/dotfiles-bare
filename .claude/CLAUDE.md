# Claude.md

## Response Conventions

- When writing math in the chat response, use ASCII characters so I can view the symbols in the terminal.

## Coding Conventions

- No emojis ever
- Always use straight quotes, never curly quotes.
- Don't touch requirements.txt. Install packages using `pip install`, then use `pip freeze > requirements.txt` to generate the file.
- When creating visualizations using Python, use Plotly by default (not Matplotlib), unless otherwise specified.

### Markdown

These instructions below are for when writing/editing markdown files.

- Have blanklines between headers
- When writing math, surround with single `$` for in-line math, and surround with double `$$` for block math.
- When writing math in the chat output, don't use the latex format but show using unicode symbols.
- When writing notes, separate clear sections by horizontal lines using `---`.
