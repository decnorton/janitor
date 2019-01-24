# janitor

An action for GitHub Actions that commits and pushes local changes back to
current branch on GitHub. Used for, e.g. keeping TOC up-to-date or clean up code
formatting.

<!-- toc -->

- [Motivation](#motivation)
- [Usage](#usage)
  - [`args = "commit (Commit message)"`](#args--commit-commit-message)
  - [`args = "push"`](#args--push)

<!-- tocstop -->

## Motivation

Using tooling to keep your files properly formatted can sometimes be annoying, —
it’s no longer practical to use GitHub’s web-based editor to edit the file
without the tool complaining about your code formatting. This is especially true
when you use, e.g. Prettier, to make sure your Markdown files are neatly
formatted.

Enter `janitor`. You can make a mess and `janitor` will clean it up, and push
the changes back to GitHub.

For example, in this repository, `janitor` is used to
[format the source code](https://github.com/dtinth/janitor/commit/4c881512129d3f29d1a35560a8421e1348f41e6a#diff-7a9076d6d94e62c13d641aa71f19ae8e)
(using [Prettier](https://github.com/prettier/prettier)) and
[update the README file’s TOC](https://github.com/dtinth/janitor/commit/63a26384fdd301ccff6adb928a4fd0064c3c5251)
(using [markdown-toc](https://github.com/jonschlinkert/markdown-toc)).

## Usage

### `args = "commit (Commit message)"`

Commits the changed files to the local repository.

**Notes:**

- A commit message is **required**.
- New files are not committed. Only updated files are committed.
- The commit is not pushed to GitHub repository. To do that, use the `push`
  action.
- By default, the commit is attributed to a bot account. To change this, you can
  override these environment variables: `EMAIL`, `GIT_COMMITTER_NAME`,
  `GIT_AUTHOR_NAME`.
- If working directory is clean, a commit will not be created.

```
action "Commit" {
  uses = "dtinth/janitor@master"
  needs = "Prettier"
  args = "commit Prettify code"
}
```

### `args = "push"`

Pushes the commits created in previous steps to the GitHub repository.

**Notes:**

- You must provide `GITHUB_TOKEN` secret so that code can be pushed.

```
action "Push" {
  uses = "dtinth/janitor@master"
  needs = ["Commit"]
  args = "push"
  secrets = ["GITHUB_TOKEN"]
}
```
