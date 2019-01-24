workflow "Janitor" {
  on = "push"
  resolves = ["Push"]
}

action "Prettier" {
  uses = "actions/npm@de7a3705a9510ee12702e124482fad6af249991b"
  runs = "npx"
  args = "prettier --write **/*.{js,md,json}"
}

action "Commit" {
  uses = "./"
  needs = ["Prettier"]
  args = "commit Prettify code"
}

action "Push" {
  uses = "./"
  needs = ["Commit"]
  args = "push"
  secrets = ["GITHUB_TOKEN"]
}
