# Global workflow rules (apply to every project)

These rules apply to ANY code change, no matter how small. You MUST follow them exactly.

## Branching

1. Never commit directly to the default branch (`master` or `main`).
2. Always start from an up to date default branch:
   ```
   git checkout master && git pull
   ```
   Use `master` instead of `main` when that is the default branch.
3. Create a new branch named `<short-kebab-description>-cl`, for example `fix-login-redirect-cl`. Do not prefix it with `feat/`, `fix/`, or any other type. Use the plain kebab name only.

## Commits

4. Write each commit message as one short plain sentence, for example `handle null user in login redirect`.
5. Do not use prefixes like `chore:` or `feat:` and do not use big or fancy words. Keep it simple so it is easy to remember.
6. Never commit everything at once. Split the work into separate commits, one per scope.
7. Only commit files that I have staged. Do not stage or commit any file I have not staged myself.
8. Keep each commit small enough to read in one sitting, around 300 lines at most. When a scope is bigger than that, split it into steps a reviewer can follow one after another, and keep every step building on its own.

## Merging

1. Do not merge on your own. I review the branch and I will tell you when to merge.
2. When a feature is done, ask me to merge before starting a new branch.
3. After I confirm and the branch is merged locally into the default branch, delete the branch.

## Unslop

After every response, run the `unslop` skill on what you wrote to strip AI tells before you send it.

## Commenting code

When you add or change comments, use the `comment` skill. Bias hard toward no comment at all and only comment when the code cannot explain itself.

## Shell

My `cd` is zoxide (`zoxide init --cmd cd` in `.zshrc`). When you run shell commands, use `builtin cd` (or `command cd`) instead of plain `cd` so you get the real directory change and not a zoxide jump.

## Bruno

Never add docs to Bruno for me. Do not write, generate, or edit Bruno documentation on my behalf.

## Skills used

At the end of every response, always add one short sentence listing which skills you used, for example `Skills used: unslop, code-review, run`. If no skill was used, write `Skills used: none`.
