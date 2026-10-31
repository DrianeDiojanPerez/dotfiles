---
name: comment
description: Cut commenting from a codebase. Comment only when code cannot explain itself, in Taylor Otwell's Laravel style. Bias hard toward writing no comment at all. Apply only when deciding whether to write a comment.
---

## Comments

Follow the real comment style Taylor Otwell uses in the Laravel framework: short
plain everyday words that explain the why, and almost nothing else.

Always run the comment text through the `unslop` skill as you write it, so the
wording stays free of AI tells and reads like a person wrote it. The rules below
set the shape and placement, `unslop` cleans up the prose inside.

### Default: write no comment

Most code needs zero comments. The default is silence. A comment is the
exception you have to justify, not the norm you reach for. If you are unsure,
leave it out, no comment is always better than a redundant one. A clean file
with no comments is a good result, not an unfinished one.

Do not comment a line just because it is public, long, or important. None of
those are reasons. The only reason is that the code cannot explain itself.

Before writing any comment, ask: would a senior developer already know this from
reading the code and the names? If yes, delete it and move on.

### Delete these on sight (changed files only)

Only touch files you have changed, staged or unstaged, the ones showing up in
`git status`. Do not reach into untouched, unrelated files to hunt comments.
Within your own changes, cut the dead comments.

These are the comments that pile up. None of them earn their place:

```php
// Get the user
$user = User::find($id);

// Loop through the orders
foreach ($orders as $order) {

// Return the result
return $result;

/**
 * Set the name.
 */
public function setName($name)
```

Each one restates what the code already says. A name like `find`, `$orders`, or
`setName` is the comment. Adding words on top is noise.

### When a comment does earn its place

Comment only when the code cannot speak for itself: the logic is non-obvious,
there is a hidden gotcha or side effect, the "why" is not visible in the code,
or a business rule or edge case is in play. Always explain WHY, never restate
WHAT. If the comment could be deleted and nothing would be lost, delete it.

Do not comment struct, class, or type declarations, in any language. This covers
Go structs, TS types and interfaces, classes, records, enums, and plain data
objects or DTOs. The fields, their names, types, and tags already state the
shape, and a header comment on top just narrates it. If a single field carries a
real gotcha, put a short note on that one field, not a block over the whole
type. Prefer no comment at all:

```go
type SendEmail struct {
	Source        string
	Template      string          `json:"template" validate:"required,max=255"`
	ReceiptNumber string          `json:"receipt_number" validate:"required,max=255"`
	To            string          `json:"to" validate:"required,email,max=255"`
	Subject       string          `json:"subject" validate:"required,max=255"`
	Payload       json.RawMessage `json:"payload"`
}
```

## Style, once a comment has earned its place

Everything below applies only after you have decided a comment is warranted.
None of it is a reason to add one.

1. Wrap comment text loosely at about 75 characters max per line, the same way
   Taylor does. Let the sentence flow and break naturally near that width. The
   lines end up roughly the same length like a normal paragraph. Do NOT make
   each line shorter than the last, it is not a shrinking triangle.

2. Docblock style, above a method or property. Write the description, then a
   blank line, then the tags. A short description sits on one line. Only write a
   docblock when the method genuinely needs one, a self-describing method does
   not.
```php
    /**
     * Register a binding with the container.
     *
     * @param  string  $abstract
     * @param  \Closure|string|null  $concrete
     * @param  bool  $shared
     * @return void
     *
     * @throws \TypeError
     */
    public function bind($abstract, $concrete = null, $shared = false)
```

3. If a docblock description needs more than one line, wrap it loosely at about
   75 characters, each line roughly the same length like a paragraph.
```php
    /**
     * Wrap the given closure such that its dependencies will be injected
     * when it is later executed, so the caller does not resolve anything
     * by hand before invoking the returned closure back to the caller.
     *
     * @param  \Closure  $callback
     * @param  array  $parameters
     * @return \Closure
     */
    public function wrap(Closure $callback, array $parameters = [])
```

4. Inline comment style, inside a function above a block of logic. Write full
   sentences that explain WHY the block exists, wrapped loosely at about 75
   characters. Place the comment right above the code it explains.
```php
    // If no concrete type was given, we will simply set the concrete type
    // to the abstract type. After that, the concrete type is registered as
    // shared without being forced to state their classes in both params.
    if (is_null($concrete)) {
        $concrete = $abstract;
    }
```

5. This shape applies ANYWHERE a comment is warranted, not only above a
   function. Short descriptions sit on one line. Longer descriptions and inline
   comments wrap loosely at about 75 characters. Always simple words, always
   explaining why, never a triangle.

6. After the docblock description add a blank line, then the type and param
   tags, but only if the language has an established doc convention. Use the
   native convention exactly: PHPDoc for PHP, JSDoc for JS and TS, Javadoc for
   Java, docstring sections for Python, and `///` doc comments for Rust. Tag
   lines keep normal formatting.

7. If the language has no doc convention, such as Go, Bash, or plain CSS, write
   only the plain description or the wrapped inline comment with no tags.
   Obvious code still gets no comment at all.
```php
    public function getName(): string
    {
        return $this->name;
    }
```

1. Use the right comment marker for the language:
    - PHP, JS, TS, Java, C#, C++ use `/** */` blocks for docblocks and `//` for inline.
    - Rust uses `///` doc comments and `//` for inline.
    - Python uses `"""` docstrings and `#` for inline.
    - Go uses `//` for both.
    - Ruby, Bash, Shell, YAML use `#`.
    - HTML uses `<!-- -->`.

## Banned comments

A saved list of sample comments the user does not want. This is the memory: when
a bad comment shows up, paste it here verbatim and the skill learns from it.
Treat each sample as an example of a whole kind, not a single literal string, so
anything of the same shape is refused too. If new code contains one of these,
drop it; if a changed file already has one, cut it.

Paste raw samples under here. A sample can be a one-line bullet or a full code
block showing the bad comment in context, whichever makes the case clearer:

- `// Get the user` over `User::find($id)`, restating the call.
- `// Loop through the orders` over a `foreach`, narrating a loop.
- `// Return the result` over `return $result`, restating the return.
- `/** Set the name. */` over `setName()`, a docblock repeating the name.
- Any header comment over a struct, class, type, interface, enum, or DTO.
Bad sample, a header comment on a plain function. The signature and the
`Bind`/`Param`/`Validate` calls already show how the inputs arrive, so the
comment adds nothing:

```go
// EmailStatus changes nothing, so the two parts that finish naming the
// receipt come in as query parameters rather than a body.
func EmailStatus(c *echo.Context) error {
	var payload dto.EmailStatus
	ctx := c.Request().Context()
	pr := provider.GetProvider(c)
	if err := c.Bind(&payload); err != nil {
		return apperror.BadRequest("invalid query", err)
	}
	payload.Source = c.Param("source")
	if err := c.Validate(&payload); err != nil {
		return err
	}
	email, err := pr.S.EmailService.Status(ctx, payload)
	if err != nil {
		return err
	}
	return c.JSON(200, response.Ok(ctx, email))
}
```
