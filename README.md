# janitor

GitHub actions to keep your repository clean.

<!-- toc -->

<!-- tocstop -->

## Problems

Using tooling to keep your files properly formatted can sometimes be annoying, as it’s no longer practical to use GitHub’s web-based editor to edit the file without the tool complaining about your format.

Enter `janitor`. You can make a mess and Janitor will clean it up, and push the changes back to GitHub.

For example, in this repository, `janitor` is used to format the source code (using [Prettier](https://github.com/prettier/prettier)) and update the README file’s TOC (using [markdown-toc])(https://github.com/jonschlinkert/markdown-toc).

## Usage

### `args = "commit <Message>"`

Commits the changed files to the local repository.

**Notes:**

- New files are not committed. Only updated files are committed.
- The commit is not pushed to GitHub repository. To do that, use the `push` action.
- By default, the committee is attributed to @ghost. To change, you can override these environment variables: `EMAIL`, `GIT_COMMITTER_NAME`, `GIT_AUTHOR_NAME`.
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

